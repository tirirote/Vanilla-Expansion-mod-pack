# projectile/move/homing_selective.mcfunction
# Homing selectivo: orientar el proyectil hacia objetivos válidos más cercanos
# que NO tengan la tag de exclusión especificada en data.proj.exclude_tag.
# Llamado con 'with entity @s data.proj' → $(homing_distance) y $(exclude_tag) disponibles.

$execute at @s if entity @e[predicate=vexp:is_target,distance=..$(homing_distance),type=!player,tag=!vexp.projectile_owner,limit=1,sort=nearest] run tp @s ~ ~ ~ facing entity @e[predicate=vexp:is_target,type=!player,distance=..$(homing_distance),tag=!vexp.$(exclude_tag),limit=1,sort=nearest] eyes
