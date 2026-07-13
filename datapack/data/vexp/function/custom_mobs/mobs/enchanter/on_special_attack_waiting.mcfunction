# Waiting for special attack
# @s is the custom mob

# Tag enchanger
execute unless entity @s[tag=vexp.enchanter_ready] run tag @s add vexp.enchanter_ready

execute as @e[type=#illager_friends,tag=!vexp.custom_mob,distance=2.5..16] at @s run function vexp:custom_mobs/helpers/try_pathfinding {speed:0.3, target_tag:"vexp.enchanter_ready"}

particle instant_effect{color:14176699} ~ ~ ~ 0.5 0.2 0.5 1 1
