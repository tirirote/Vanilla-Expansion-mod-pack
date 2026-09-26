# Natural spawn check for Wind Burster (zombie-based).
# @s is a freshly spawned zombie.

execute unless biome ~ ~ ~ #minecraft:has_structure/pillager_outpost run return 0

# ~1.5% chance per eligible zombie.
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..15 run return 0

function vexp:custom_mobs/mobs/wind_burster/setup
