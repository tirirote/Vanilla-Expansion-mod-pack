# projectile/move/orbit.mcfunction
# Reubicar el proyectil en posición orbital relativa al dueño.
# Posición = dueño + dirección_actual_proyectil * radius.
# El radio ya fue expandido en move.mcfunction antes de esta llamada.
# Búsqueda del dueño por vexp.id (tag vexp.projectile_owner eliminado en spawn).
# Llamado con 'with entity @s data.proj' → $(radius) disponible (valor ya actualizado).

tag @s add vexp.orbit_temp
scoreboard players operation #orbit_owner vexp.math = @s vexp.id
$execute as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^ ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~1.5 ~
tag @s remove vexp.orbit_temp
