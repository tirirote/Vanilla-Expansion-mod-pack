# Natural spawn check for Ashling (pig-based).
# @s is a freshly spawned pig.

execute unless biome ~ ~ ~ #vexp:natural_spawn/ashling run return 0

# ~2.5% chance per eligible pig.
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..25 run return 0

function vexp:custom_mobs/mobs/ashling/setup
