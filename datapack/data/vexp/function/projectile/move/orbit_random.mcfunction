# projectile/move/orbit_random.mcfunction
# Posicion aditiva: primero posicion relativa al dueño (radius), luego offset random.
# Llamado con 'with entity @s data.proj' -> $(radius), $(randomness) disponibles.

function vexp:utils/get_random_128

tag @s add vexp.orbit_temp
scoreboard players operation #orbit_owner vexp.math = @s vexp.id

$execute if score #random vexp.id matches ..-97 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^ ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches -96..-65 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^ ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches -64..-33 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches -32..-1 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^-$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches 0..31 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches 32..63 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches 64..95 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^-$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score #random vexp.id matches 96.. as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^-$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~

tag @s remove vexp.orbit_temp
