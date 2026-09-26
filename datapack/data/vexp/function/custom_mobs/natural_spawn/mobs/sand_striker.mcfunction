# Natural spawn check for Sand Striker (wolf-based).
# @s is a freshly spawned wolf.

execute unless biome ~ ~ ~ #vexp:natural_spawn/sand_striker run return 0

# ~2.5% chance per eligible wolf.
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..25 run return 0

function vexp:custom_mobs/mobs/sand_striker/setup
