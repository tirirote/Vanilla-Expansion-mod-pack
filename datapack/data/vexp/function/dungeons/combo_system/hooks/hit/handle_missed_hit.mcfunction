# Manage when player misses a hit
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id

# Hit miss fallback position
$execute positioned ~ ~1 ~ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^ ^ ^1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^ ^ ^-1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^ ^ ^2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^ ^ ^-2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss

$execute positioned ~ ~1 ~ positioned ^1 ^ ^ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-1 ^ ^ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^2 ^ ^ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-2 ^ ^ positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss

$execute positioned ~ ~1 ~ positioned ^1 ^ ^1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^1 ^ ^-1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-1 ^ ^1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-1 ^ ^-1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss

$execute positioned ~ ~1 ~ positioned ^1 ^ ^2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^1 ^ ^-2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-1 ^ ^2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-1 ^ ^-2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss

$execute positioned ~ ~1 ~ positioned ^2 ^ ^1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^2 ^ ^-1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-2 ^ ^1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-2 ^ ^-1 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss

$execute positioned ~ ~1 ~ positioned ^2 ^ ^2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^2 ^ ^-2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-2 ^ ^2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss
$execute positioned ~ ~1 ~ positioned ^-2 ^ ^-2 positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id unless entity @s[tag=vexp.hitted] run tag @s add vexp.hitted_miss

execute as @e[tag=vexp.hitted_miss] at @s run function vexp:mob_health/spawn_damage_on_hit {damage:-1}
