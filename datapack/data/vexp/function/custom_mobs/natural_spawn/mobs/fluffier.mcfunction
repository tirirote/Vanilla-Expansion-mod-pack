# Natural spawn check for Fluffier (chicken-based).
# @s is a freshly spawned chicken.

execute unless biome ~ ~ ~ #vexp:natural_spawn/fluffier run return 0

# ~3% chance per eligible chicken.
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..30 run return 0

function vexp:custom_mobs/mobs/fluffier/setup
