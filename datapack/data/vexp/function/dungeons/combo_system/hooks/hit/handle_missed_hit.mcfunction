# Tag all valid entities in AoE range, centered 1 block above the player and $(reach) blocks forward.
# Guards removed: by the time this runs, @s is guaranteed to be the attacker (hitbox on_attack
# chain ensures correct player context), and a hitbox is guaranteed to exist.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id
# tag=!vexp.attacker was dropped: it excludes ANY currently-attacking entity, not just
# myself, which blocked PvP whenever both players were mid-swing at the same time.
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
