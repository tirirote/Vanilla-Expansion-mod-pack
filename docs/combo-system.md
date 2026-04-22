# Combo System

Ruta principal: datapack/data/vexp/function/dungeons/combo_system

## Que resuelve

Gestiona hitboxes, ataques, combos, parry, click derecho y enrutado por tipo/calidad de arma.

## Tick principal

Archivo: dungeons/combo_system/tick.mcfunction

Responsabilidades:

1. Snapshot de look para efectos (swoosh scaling).
2. Gestion de hitboxes (crear/actualizar/eliminar).
3. Cooldowns globales (combo, skill, hide timer).
4. Procesar attack/interact en hitboxes.
5. Procesar parry.

## Flujo de hit

1. hitbox/process detecta attack/interact si cooldown=0.
2. Se calcula objetivo y dano efectivo.
3. hooks/handle_hit ejecuta:
   - route_on_hit (por quality + item)
   - combos/process_short|mid|long
   - end_combo si aplica
   - spawn_damage_on_hit para feedback visual

## Router por calidad

Archivos:

- hooks/route_on_hit.mcfunction
- hooks/route_on_combo.mcfunction
- hooks/route_on_right_click.mcfunction
- hooks/route_on_parry.mcfunction

Calidades especiales actuales:

- netherite
- echo
- diamond
- gold

Si no coincide, usa ruta base del arma.

## Storage comun del sistema

Storage: vexp:dungeons.weapon combo_params

Campos importantes:

- item
- type
- quality
- cooldown
- right_click_cooldown
- damage / crit params (segun pipeline)

Wrappers que lo rellenan:

- handle_hit_wrapper.mcfunction
- end_combo_wrapper.mcfunction
- hooks/apply_interact_params_wrapper.mcfunction
- hooks/apply_parry_wrapper.mcfunction

## Ejemplo de right click

```mcfunction
# wrapper lee custom_data del arma y setea cooldown
execute if score @s vexp.skill_cooldown matches 0 run function vexp:dungeons/combo_system/hooks/apply_interact_params with storage vexp:dungeons.weapon combo_params
```

```mcfunction
# apply_interact_params
$scoreboard players set @s vexp.skill_cooldown $(right_click_cooldown)
execute positioned ~ ~1.5 ~ run function vexp:dungeons/combo_system/hooks/route_on_right_click with storage vexp:dungeons.weapon combo_params
```

## Recomendaciones de extension

1. No llamar hooks de arma directamente desde hitbox; usar wrappers+routers.
2. Mantener calidad en custom_data.vexp.combo.quality.
3. Si agregas nueva calidad, actualizar los cuatro routers.
4. Mantener limpieza de tags transitorias al final de tick.
