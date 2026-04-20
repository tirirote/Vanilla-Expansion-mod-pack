# projectile/move/orbit.mcfunction
# Reubicar el proyectil en posición orbital relativa al dueño.
# Posición = dueño + dirección_actual_proyectil * radius.
# El radio ya fue expandido en move.mcfunction antes de esta llamada.
# Búsqueda del dueño por vexp.id (tag vexp.projectile_owner eliminado en spawn).
# Llamado con 'with entity @s data.proj' → $(radius), $(orbit_height) disponibles.

tag @s add vexp.orbit_temp
scoreboard players operation #orbit_owner vexp.math = @s vexp.id
execute store result score #orbit_face vexp.math run data get entity @s data.proj.face_player

# face_player=1: radius follows owner look direction.
$execute if score #orbit_face vexp.math matches 1.. as @a if score @s vexp.id = #orbit_owner vexp.math at @s positioned ^ ^ ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(orbit_height) ~

# face_player=0: radius follows projectile own rotation (camera-independent tornado behavior).
$execute unless score #orbit_face vexp.math matches 1.. as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^ ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(orbit_height) ~
tag @s remove vexp.orbit_temp
