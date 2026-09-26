# Natural spawn check for Mummy (husk-based, guards the desert fortress).
# @s is a freshly spawned husk.

execute unless biome ~ ~ ~ #vexp:has_structure/desert_fortress run return 0

# ~40% chance per eligible husk inside the fortress (feels actively guarded).
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..400 run return 0

function vexp:custom_mobs/mobs/mummy/setup
