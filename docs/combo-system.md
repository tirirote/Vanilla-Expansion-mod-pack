# Combo System

`datapack/data/vexp/function/dungeons/combo_system`

## Que resuelve

Implementa un sistema de combate nuevo con **combos**, **parry**, **click derecho** mediante hitbox, permitiendo crear armas con diferentes atributos y calidades.

>
>[!INFO] Como funciona
> 1. El tick principal actualiza la información de cámara, las hitboxes activas y los cooldowns globales del sistema.
> 2. Cada hitbox comprueba si ha recibido `attack` o `interaction` y solo procesa la acción si el arma no esta en cooldown.
> 3. En un golpe normal, el sistema identifica una entidad valida con el predicado **vexp:is_target**, calcula el daño efectivo y marca el objetivo con tags temporales como `vexp.hitted`.
> 4. El wrapper del arma copia `custom_data.vexp` a `storage vexp:dungeons.weapon combo_params`, de forma que el resto del pipeline trabaja con `item`, `type`, `quality`, `cooldown` y demás parametros ya resueltos.
> 5. `hooks/route_on_hit` llama al hook correcto según `type` y `quality` del arma; después el sistema avanza el combo (`short`, `mid` o `long`) y decide si este ha terminado.
> 6. Si el combo termina, `end_combo` marca a los objetivos afectados con `vexp.hitted.combo_end`, ejecuta `route_on_combo`, lanza feedback visual y resetea el contador del combo del jugador.
> 7. En click derecho, `apply_interact_params_wrapper` aplica el cooldown de habilidad, rellena `combo_params` y despacha a `route_on_right_click`, que llama al hook especifico del arma o de su calidad.
> 8. En parry, mientras `vexp.parry_timer` esta activo, el sistema compara `damage_taken` con `parry_damage_snapshot`; si hubo dano en la ventana, ejecuta `apply_parry_wrapper` y luego `route_on_parry`.
> 9. Al final del flujo, el sistema genera feedback de dano, limpia tags transitorias y deja el estado listo para el siguiente tick.

## Tick principal

`dungeons/combo_system/tick.mcfunction`

Gestiona:

1. Snapshot de look para efectos (swoosh scaling).
2. Gestion de hitboxes (crear/actualizar/eliminar).
3. Cooldowns globales (combo, skill, hide timer).
4. Procesar attack/interact en hitboxes.
5. Procesar parry.

## Sistema de hitbox

`combo_system/hitbox/`

>[!INFO] Cómo funciona
>
>Las hitboxes son entidades `interaction` invocadas delante del jugador que detectan `attack` e `interaction` en su lugar. Permiten controlar de forma precisa el daño, área, alcance, sobreescribiendo el sistema vanilla de Minecraft.

### Ciclo de vida

```
manage.mcfunction
  └─ tag vexp.combo_user si sostiene arma de tipo *_combo
  └─ evaluate_summon → si no existe hitbox para este jugador, llama summon.mcfunction
  └─ update → update_pos (sigue al jugador) + sincroniza vexp.combo_cooldown
```

- **Summon**: invoca `interaction` con `Tags:["vexp.combo_hitbox"]` y le asigna el mismo `vexp.id` que el jugador propietario.
- **Update\_pos**: reposiciona la hitbox a `~ ~1 ~` del jugador cada tick (delante de los ojos) y copia el cooldown del jugador a la hitbox para que `process` lo compruebe localmente.
- **Destroy**: si el jugador deja de sostener el arma, la hitbox sin `vexp.combo_user` asociado es eliminada en el siguiente ciclo de `manage`.

### process.mcfunction

```
process.mcfunction
  └─ Si vexp.combo_cooldown == 0 → tag vexp.hitbox.ready
  └─ [ready] if data attack    → on_attack    (prioridad alta)
  └─ [ready] if data interaction → on_interact (solo si no hay ataque)
  └─ data remove attack / interaction  (siempre, evita doble disparo)
  └─ tag remove vexp.hitbox.ready
```

Si hay cooldown activo, la hitbox no dispara. El dato `attack`/`interaction` se borra siempre para evitar doble disparo.

---

## Flujo de hit completo

```
hitbox/process (on_attack)
  └─ hitbox/damage_aoe       → marca vexp.hitted en objetivos dentro del alcance
  └─ handle_hit_wrapper      → copia SelectedItem.custom_data.vexp → storage combo_params
       └─ hooks/handle_hit
            ├─ hitted_entity.mcfunction    (glowing + equipo de color)
            ├─ route_on_hit                (hook especifico del arma/calidad)
            ├─ armor/on_hit
            ├─ damage_mainhand_durability
            ├─ handle_crit_hit             (si vexp.hit_critical)
            ├─ combos/process_short|mid|long
            ├─ end_combo                   (si vexp.combo_end)
            └─ mob_health/spawn_damage_on_hit
```

### damage_aoe

Busca entidades validas dentro del rango del arma con el predicado `vexp:is_target` y les aplica dano.
Las entidades golpeadas reciben el tag `vexp.hitted` (temporal, se limpia al final del tick).

### handle_hit_wrapper

Antes de llamar a `handle_hit`, el wrapper copia los datos del item actual del jugador a `storage vexp:dungeons.weapon combo_params`:

```mcfunction
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:dungeons.weapon combo_params.item    set from entity @s SelectedItem...vexp.item
data modify storage vexp:dungeons.weapon combo_params.type    set from entity @s SelectedItem...vexp.type
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem...vexp.combo.quality
```

Esto evita condiciones de carrera en multijugador: cada jugador trabaja con su propio snapshot en storage.

---

## Progresión de combos

El campo `vexp.type` del item define cuantos golpes forman el combo completo:

| type | golpes |
|------|--------|
| `short_combo` | 2 |
| `mid_combo` | 3 |
| `long_combo` | 5 |

### Logica interna

`combos/process_short.mcfunction`:
```mcfunction
scoreboard players add @s vexp.combo 1
execute if score @s vexp.combo matches 2.. run tag @s add vexp.combo_end
```

Los tres archivos son identicos salvo el threshold (`2..`, `3..`, `5..`).
El score `vexp.combo` se incrementa en cada golpe que conecta. Cuando alcanza el limite, se añade `vexp.combo_end` al jugador.

### Finisher (end_combo)

`hooks/end_combo.mcfunction` se ejecuta inmediatamente despues de `process_*` si `vexp.combo_end` esta presente:

```mcfunction
# 1. Marca todos los objetivos golpeados en este tick con combo_end
execute as @e[tag=vexp.hitted, distance=..8] at @s run tag @s add vexp.hitted.combo_end

# 2. Llama al hook de finisher del arma (via router por calidad)
function vexp:dungeons/combo_system/hooks/route_on_combo with storage vexp:dungeons.weapon combo_params
function vexp:dungeons/armor/on_combo

# 3. Feedback visual de finisher
execute as @e[tag=vexp.hitted, distance=..8] at @s run particle minecraft:damage_indicator ~ ~1 ~ .5 .5 .5 0.2 3

# 4. Reset
scoreboard players set @s vexp.combo 0
tag @s remove vexp.combo_end
```

El router `route_on_combo` sigue el mismo patron que `route_on_hit`: calidad especial primero, fallback base.

---

## Click derecho

El click derecho activa la habilidad especial del arma. La deteccion se hace a traves de la hitbox cuando recibe `interaction` (el jugador hace click derecho mirando la hitbox), o bien via un avancement listener externo que llama directamente a `apply_interact_params_wrapper`.

### Flujo completo

```
hitbox/on_interact  (o avancement listener)
  └─ apply_interact_params_wrapper
       ├─ Comprueba vexp.skill_cooldown == 0
       ├─ Copia item data → storage combo_params
       ├─ Resuelve right_click_cooldown (fallback a cooldown si no definido)
       └─ Si cooldown==0 → apply_interact_params
            ├─ Asigna vexp.skill_cooldown = $(right_click_cooldown)
            ├─ damage_mainhand_durability
            └─ route_on_right_click with storage combo_params
       └─ Siempre → revoke_attack_advancement  (permite re-deteccion)
```

### apply_interact_params_wrapper

```mcfunction
# Solo ejecuta la habilidad si el cooldown esta en 0
execute if score @s vexp.skill_cooldown matches 0 run function vexp:dungeons/combo_system/hooks/apply_interact_params with storage vexp:dungeons.weapon combo_params

# Revoca el avancement siempre (con o sin cooldown) para poder re-detectar el siguiente click
function vexp:dungeons/combo_system/hooks/revoke_attack_advancement with storage vexp:dungeons.weapon combo_params
```

### route_on_right_click

```mcfunction
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} run function vexp:dungeons/$(item)/netherite/on_right_click
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"}      run function vexp:dungeons/$(item)/echo/on_right_click
$execute if data storage vexp:dungeons.weapon combo_params{quality:"diamond"}   run function vexp:dungeons/$(item)/diamond/on_right_click
$execute if data storage vexp:dungeons.weapon combo_params{quality:"gold"}      run function vexp:dungeons/$(item)/gold/on_right_click

# Fallback para calidad normal o no definida
$execute unless data ...{quality:"netherite"} unless ...{quality:"echo"} unless ...{quality:"diamond"} unless ...{quality:"gold"} run function vexp:dungeons/$(item)/on_right_click
```

El `$(item)` se resuelve con la macro system de Minecraft 1.20.5+, usando el valor de `combo_params.item` del storage.

### Cooldown de habilidad vs cooldown de golpe

| Score | Proposito |
|-------|-----------|
| `vexp.combo_cooldown` | Bloquea golpes normales (decrementado en tick) |
| `vexp.skill_cooldown` | Bloquea el click derecho (decrementado en tick) |

Ambos se decrementan en `combo_system/tick.mcfunction`.

---

## Parry

El parry permite al jugador absorber un golpe enemigo durante una ventana de tiempo y contraatacar.

### Activacion

Cada arma con soporte de parry activa el timer desde su `on_right_click`:

```mcfunction
# Ejemplo en dagger/on_right_click.mcfunction
scoreboard players set @s vexp.parry_timer 10
scoreboard players operation @s vexp.parry_damage_snapshot = @s vexp.damage_taken
```

- `vexp.parry_timer`: ticks restantes de ventana activa (se decrementa en `parry.mcfunction`).
- `vexp.parry_damage_snapshot`: valor de `vexp.damage_taken` en el momento de activar el parry, para poder detectar si el jugador recibio dano nuevo.

### Deteccion (parry.mcfunction)

```mcfunction
# Calcula si hubo dano nuevo dentro de la ventana
scoreboard players operation #parry_delta vexp.math = @s vexp.damage_taken
scoreboard players operation #parry_delta vexp.math -= @s vexp.parry_damage_snapshot

# Si hay delta positivo: el jugador recibio un golpe → parry exitoso
execute if score #parry_delta vexp.math matches 1.. on attacker run tag @s add vexp.parried
execute if score #parry_delta vexp.math matches 1.. run function vexp:dungeons/combo_system/hooks/apply_parry_wrapper

scoreboard players remove @s vexp.parry_timer 1
```

El `on attacker` marca al atacante real con `vexp.parried` para que los hooks de parry puedan identificarlo.

### apply_parry_wrapper

```mcfunction
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem...vexp.combo
data modify storage vexp:dungeons.weapon combo_params.item    set from entity @s SelectedItem...vexp.item
data modify storage vexp:dungeons.weapon combo_params.type    set from entity @s SelectedItem...vexp.type
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem...vexp.combo.quality

function vexp:dungeons/combo_system/hooks/route_on_parry with storage vexp:dungeons.weapon combo_params
```

### route_on_parry

Mismo patron de router por calidad que los demas hooks:

```mcfunction
$execute if data storage vexp:dungeons.weapon combo_params{quality:"netherite"} run function vexp:dungeons/$(item)/netherite/on_parry
$execute if data storage vexp:dungeons.weapon combo_params{quality:"echo"}      run function vexp:dungeons/$(item)/echo/on_parry
# ... diamond, gold ...
$execute unless ... run function vexp:dungeons/$(item)/on_parry
```

Dentro del `on_parry` del arma, el atacante esta disponible como `@e[tag=vexp.parried]`. La tag se limpia al final del tick en `combo_system/tick.mcfunction`.

### Resumen del flujo de parry

```
on_right_click del arma
  └─ parry_timer = N  +  parry_damage_snapshot = damage_taken

tick.mcfunction (cada tick mientras parry_timer > 0)
  └─ parry.mcfunction
       ├─ #parry_delta = damage_taken - snapshot
       ├─ Si delta > 0:
       │    ├─ on attacker → tag vexp.parried al atacante
       │    └─ apply_parry_wrapper → route_on_parry → arma/calidad/on_parry
       └─ parry_timer -= 1

fin del tick
  └─ limpieza de vexp.parried
```

---

## Router por calidad

Los cuatro routers del sistema siguen el mismo patron: calidades especiales primero, fallback base al final.

| Router | Cuando se llama |
|--------|-----------------|
| `route_on_hit` | En cada golpe que conecta |
| `route_on_combo` | Solo cuando el combo llega al finisher |
| `route_on_right_click` | En click derecho con skill_cooldown==0 |
| `route_on_parry` | Cuando se detecta un parry exitoso |

Calidades especiales actuales: `netherite`, `echo`, `diamond`, `gold`.
Si la calidad no coincide con ninguna, se usa la ruta base `vexp:dungeons/$(item)/on_*`.

---

## Storage comun del sistema

Storage: `vexp:dungeons.weapon combo_params`

| Campo | Tipo | Descripcion |
|-------|------|-------------|
| `item` | string | Nombre del arma (p.ej. `"dagger"`) — usado por macros `$(item)` |
| `type` | string | `"short_combo"`, `"mid_combo"` o `"long_combo"` |
| `quality` | string | `"netherite"`, `"echo"`, `"diamond"`, `"gold"`, o ausente |
| `cooldown` | int | Ticks de cooldown entre golpes |
| `right_click_cooldown` | int | Ticks de cooldown de habilidad (fallback a `cooldown`) |

Wrappers que lo rellenan:

- `handle_hit_wrapper.mcfunction`
- `end_combo_wrapper.mcfunction`
- `hooks/apply_interact_params_wrapper.mcfunction`
- `hooks/apply_parry_wrapper.mcfunction`

---

## Feedback visual y dano

### hitted_entity.mcfunction

Se ejecuta `as @e[tag=vexp.hitted]` inmediatamente tras detectar el golpe:

```mcfunction
effect give @s minecraft:glowing 1 1 true
execute if entity @s[tag=vexp.hitted.combo_end] run team join vexp.red    @s   # finisher → rojo
execute unless entity @s[tag=vexp.hitted.combo_end] run team join vexp.yellow @s # golpe normal → amarillo
tag @s add vexp.feedback_glowing
particle minecraft:entity_effect{color:2084647218} ~ ~1 ~ .2 .2 .2 0 3
```

### spawn_damage_on_hit

Invocado `as @e[tag=vexp.hitted]` al final de `handle_hit`. Genera el indicador de dano flotante. Si la entidad tiene `vexp.hitted.combo_end`, el indicador puede usar un color o escala diferente segun el hook del arma.

### Tags transitorias y su limpieza

| Tag | Limpiada en |
|-----|-------------|
| `vexp.hitted` | Final de `combo_system/tick.mcfunction` |
| `vexp.hitted.combo_end` | Final de `combo_system/tick.mcfunction` |
| `vexp.feedback_glowing` | Timer en `tick.mcfunction` (hide_timer) |
| `vexp.parried` | Final de `combo_system/tick.mcfunction` |
| `vexp.combo_end` | Dentro de `end_combo.mcfunction` tras ejecutar |

---

## Recomendaciones de extension

1. **No llamar hooks de arma directamente desde hitbox**: usar siempre wrappers → routers.
2. **Calidad en `custom_data.vexp.combo.quality`**: los routers leen de storage, pero el storage se rellena desde este campo.
3. **Nueva calidad**: anadir la linea `$execute if data ...{quality:"nueva"}` en los cuatro routers (`route_on_hit`, `route_on_combo`, `route_on_right_click`, `route_on_parry`).
4. **Nuevo tipo de combo**: anadir la entrada en `handle_hit.mcfunction` (`execute if items ... *[custom_data~{vexp:{type:"nueva_combo"}}]`) y crear `combos/process_nueva.mcfunction`.
5. **Parry en nueva arma**: activar `vexp.parry_timer` y guardar snapshot en `on_right_click`; crear `on_parry.mcfunction` en la carpeta del arma.
6. **Limpieza de tags transitorias**: cualquier tag nueva que se use dentro del pipeline debe limpiarse al final de `combo_system/tick.mcfunction`.
