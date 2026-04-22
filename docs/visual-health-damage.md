# Visual Health and Damage System

Ruta principal: `datapack/data/vexp/function/mob_health`

## Que resuelve

Muestra una barra de vida "minimalista" encima del mob, incluyendo el nombre actual del mob (compatible con _nametags_).

![alt text](/docs/images/mob_hp.png)

## Flujo barra de vida

1. mob_health/tick limpia estado activo de barras.
2. Para entidades inicializadas (vexp.health_init), llama update.
3. Para nuevas entidades target con Health, llama update y luego init si hace falta.
4. El text_display se monta como pasajero del mob.
5. update_bar aplica texto/color segun vida actual.

## Inicializacion

Archivo: `mob_health/init.mcfunction`

- Asigna la tag "vexp.id" al mob si falta.
- Guarda snapshot old_hp.
- Summon text_display con tag vexp.health_bar.
- Ride mount para seguir al mob.

## Indicadores de daño

Puedes spawnear un damage indicator con la siguiente función.

- `function mob_health/spawn_damage_on_hit`

### Cómo funciona?

- Compara old_hp vs Health actual para calcular dano real.
- Si el dano todavia no esta reflejado en Health, usa fallback desde combo_params.eff_damage.
- Ajusta color/estilo:
  - amarillo: hit normal
  - rojo: combo end
  - dorado: critico
- Llama spawn_damage para crear text_display temporal.

## Integración con otros sistemas

EL sistema de vida integra _"damage indicators"_ que son spawneables desde:

- `dungeons/combo_system/hooks/handle_hit`

```mcfunction
# Spawn damage indicators after combo state has been finalized for this hit
execute as @e[tag=vexp.hitted] at @s run function vexp:mob_health/spawn_damage_on_hit
```

- `dungeons/bow/arrows/hooks/on_hit_mob`

```mcfunction
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] at @s run function vexp:dungeons/bow/arrows/hooks/spawn_damage_indicator
```

- `projectile/on_hit_mob`

```mcfunction
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] if score #temp vexp.math matches 1.. at @s run function vexp:mob_health/spawn_damage
```

## Renderizado

El indicador de vida es una entidad de tipo "text_display" (mucho mejor optimizado que los armor stands antiguos).

Puedes personalizar el idicador en `mob_health/apply_name`

```mcfunction
$data modify entity @s text set value {"text":"","extra":[$(name),{"text":"\n","color":"white"},{"text":"$(hp) ❤","color":"$(color)"}]}
```
