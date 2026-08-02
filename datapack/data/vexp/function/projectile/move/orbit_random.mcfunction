# projectile/move/orbit_random.mcfunction
# Posicion aditiva: primero posicion relativa al dueño (radius), luego offset random.
# Llamado con 'with entity @s data.proj' -> $(radius), $(randomness) disponibles.

execute store result score @s vexp.rand run random value -250..400

tag @s add vexp.orbit_temp
scoreboard players operation #orbit_owner vexp.math = @s vexp.id

$execute if score @s vexp.rand matches ..-200 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^ ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches -199..-150 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^ ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~

$execute if score @s vexp.rand matches -149..-100 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches -99..-50 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^$(randomness) ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 49..0 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^-$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 1..49 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^ ^-$(randomness) ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~

$execute if score @s vexp.rand matches 50..99 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 100..149 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^$(randomness) ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 150..199 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^-$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 200..249 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^$(randomness) ^-$(randomness) ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 250..299 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 300..349 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^$(randomness) ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 350..399 as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^-$(randomness) ^$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~
$execute if score @s vexp.rand matches 400.. as @a if score @s vexp.id = #orbit_owner vexp.math at @s rotated as @e[tag=vexp.orbit_temp,limit=1] positioned ^-$(randomness) ^-$(randomness) ^-$(radius) run tp @e[tag=vexp.orbit_temp,limit=1] ~ ~$(height) ~

tag @s remove vexp.orbit_temp
