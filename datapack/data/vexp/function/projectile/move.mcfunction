# projectile/move.mcfunction
# Movimiento del proyectil combinando velocidad y gravedad
# @s es el proyectil
# Macro que recibe proj.speed y proj.gravity desde el NBT del proyectil

# Convertimos gravity a scoreboard (x100) para poder comparar si es > 1.0
execute store result score #proj_gravity vexp.math run data get entity @s data.proj.gravity 100
execute store result score #proj_randomness vexp.math run data get entity @s data.proj.randomness 100
execute store result score #proj_homing vexp.math run data get entity @s data.proj.homing_distance 100

# Movimiento combinado: si hay randomness, aplicar desvio + avance en el mismo paso
$execute if score #proj_randomness vexp.math matches 1.. if score #proj_gravity vexp.math matches 101.. run function vexp:projectile/erratic_step {strength:$(randomness), speed:$(speed), gravity:$(gravity)}
$execute if score #proj_randomness vexp.math matches 1.. unless score #proj_gravity vexp.math matches 101.. run function vexp:projectile/erratic_step {strength:$(randomness), speed:$(speed), gravity:0}

# Fallback sin randomness: movimiento estandar
$execute unless score #proj_randomness vexp.math matches 1.. if score #proj_gravity vexp.math matches 101.. run tp @s ^ ^ ^$(speed) ~ ~$(gravity)
$execute unless score #proj_randomness vexp.math matches 1.. unless score #proj_gravity vexp.math matches 101.. run tp @s ^ ^ ^$(speed)

# Homing: turn projectile toward nearest valid target in configured radius
$execute if score #proj_homing vexp.math matches 1.. at @s if entity @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..$(homing_distance),limit=1,sort=nearest] run tp @s ~ ~ ~ facing entity @e[type=!player,type=!item,type=!marker,type=!interaction,type=!item_display,type=!area_effect_cloud,distance=..$(homing_distance),limit=1,sort=nearest] eyes
