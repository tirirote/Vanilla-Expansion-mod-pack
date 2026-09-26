# Natural spawn check for Snitcher (zombie-based).
# @s is a freshly spawned zombie.

execute unless biome ~ ~ ~ #vexp:natural_spawn/snitcher run return 0

# ~2% chance per eligible zombie.
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..20 run return 0

function vexp:custom_mobs/mobs/snitcher/setup
