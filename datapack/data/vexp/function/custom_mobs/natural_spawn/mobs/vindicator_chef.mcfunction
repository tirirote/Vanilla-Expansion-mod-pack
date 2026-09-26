# Natural spawn check for Vindicator Chef (vindicator-based, settlement cook).
# @s is a freshly spawned vindicator.

execute unless biome ~ ~ ~ #minecraft:has_structure/woodland_mansion run return 0

# ~50% chance per eligible vindicator inside the settlement.
scoreboard players set #natural_spawn_roll vexp.math 0
execute store result score #natural_spawn_roll vexp.math run random value 1..1000
execute unless score #natural_spawn_roll vexp.math matches ..500 run return 0

function vexp:custom_mobs/mobs/vindicator_chef/setup
