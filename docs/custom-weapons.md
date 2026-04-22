# Custom Weapons and Hooks

Ruta principal: datapack/data/vexp/function/dungeons

## Modelo de arma

Cada arma define comportamiento en hooks base y opcionalmente por calidad.

Ejemplo estructura (scythe):

```text
dungeons/scythe/
  on_hit.mcfunction
  on_combo.mcfunction
  on_right_click.mcfunction
  netherite/on_hit.mcfunction
  netherite/on_combo.mcfunction
  netherite/on_right_click.mcfunction
  echo/...
  diamond/...
  gold/...
  give.mcfunction
  give_macro.mcfunction
```

## Hooks principales por arma

- on_hit: reaccion por golpe individual.
- on_combo: efecto al cerrar combo.
- on_right_click: habilidad activa.
- on_parry: solo para armas que lo usan (por router).

## Ejemplo real de hook base

```mcfunction
# dungeons/scythe/on_hit.mcfunction
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
```

## Ejemplo real de right click con proyectil

```mcfunction
# dungeons/scythe/on_right_click.mcfunction
tag @s add vexp.projectile_owner
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.scythe_projectile",proj_type:"common_scythe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:armor_stand,tag=vexp.scythe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn
```

## Relacion con custom_data del item

Los routers leen estos campos desde SelectedItem.components.minecraft:custom_data.vexp:

- item: familia (sword, scythe, dagger, etc).
- type: short_combo | mid_combo | long_combo.
- combo.quality: normal | netherite | echo | diamond | gold.
- combo.cooldown y combo.right_click_cooldown.

## Checklist para crear arma nueva

1. Crear recetas con custom_data consistente.
2. Implementar hooks base en dungeons/<arma>/.
3. Implementar variantes por calidad si aplica.
4. Crear give y give_macro alineados con recetas.
5. Probar:
   - on_hit
   - combo finisher
   - right click cooldown
   - parry (si aplica)

## Recomendaciones

- Mantener nombres de familia simples y estables (se usan en routers).
- Evitar logica duplicada entre calidades; extraer helpers en utils cuando se repita.
- Si cambias quality model, auditar routers y wrappers.
