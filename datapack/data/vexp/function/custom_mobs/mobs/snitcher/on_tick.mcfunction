# On tick hook
# @s is the custom mob
execute store result score @s vexp.rand run random value 0..100
execute as @e[type=#illager_friends,distance=..16,sort=nearest] unless entity @s[tag=vexp.custom_mob] unless entity @s[tag=vexp.snitcher_illager_mom] run tag @s add vexp.snitcher_illager_mom
execute as @e[type=#illager_friends,distance=16..,sort=nearest] if entity @s[tag=vexp.snitcher_illager_mom] run tag @s remove vexp.snitcher_illager_mom

execute if entity @e[tag=vexp.snitcher_illager_mom,distance=2.5..16,sort=nearest,limit=1] run function vexp:custom_mobs/helpers/try_pathfinding {speed: 0.4, target_tag:"vexp.snitcher_illager_mom"}
