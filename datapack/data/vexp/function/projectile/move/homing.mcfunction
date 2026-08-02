# projectile/move/homing.mcfunction
# Orientar el proyectil hacia el objetivo válido más cercano dentro del rango de homing.
# Aplicado DESPUÉS del movimiento posicional para no ser sobreescrito.
# Llamado con 'with entity @s data.proj' → $(homing_distance) disponible.

tag @s add vexp.homing_proj_temp
tag @e[tag=vexp.homing_valid_target] remove vexp.homing_valid_target
$execute at @s as @e[predicate=vexp:is_target,type=!player,distance=..$(homing_distance)] unless score @s vexp.id = @e[tag=vexp.homing_proj_temp,distance=..0.01,limit=1] vexp.id run tag @s add vexp.homing_valid_target
$execute at @s if entity @e[tag=vexp.homing_valid_target,distance=..$(homing_distance),limit=1,sort=nearest] run tp @e[tag=vexp.homing_proj_temp,distance=..0.01,limit=1] ~ ~ ~ facing entity @e[tag=vexp.homing_valid_target,distance=..$(homing_distance),limit=1,sort=nearest] eyes
tag @e[tag=vexp.homing_valid_target] remove vexp.homing_valid_target
tag @s remove vexp.homing_proj_temp
