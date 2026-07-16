# projectile/move/homing.mcfunction
# Orientar el proyectil hacia el objetivo válido más cercano dentro del rango de homing.
# Aplicado DESPUÉS del movimiento posicional para no ser sobreescrito.
# Llamado con 'with entity @s data.proj' → $(homing_distance) disponible.

$execute at @s if entity @e[predicate=vexp:is_target,type=!player,distance=..$(homing_distance),limit=1,sort=nearest] run tp @s ~ ~ ~ facing entity @e[predicate=vexp:is_target,type=!player,distance=..$(homing_distance),limit=1,sort=nearest] eyes
