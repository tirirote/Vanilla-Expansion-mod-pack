# On special attack feedback hook
# @s is the custom mob
# Buff friend illagers
execute as @e[type=#illager_friends,distance=..12] at @s run function vexp:dungeons/states/enchanter_buff
execute as @e[type=#illager_friends,distance=..12] at @s run particle instant_effect{color:14176699,power:1} ~ ~ ~ 0.2 0.2 0.2 1 3
execute as @e[type=#illager_friends,distance=..12] at @s run particle dust_color_transition{from_color:14176699,to_color:7483520,scale:0.8} ~ ~ ~ 0.2 0.2 0.2 1 5

tag @s remove vexp.enchanter_ready

#Feedback
function vexp:utils/sound {sound: "minecraft:entity.illusioner.prepare_mirror", type: "player", pitch:1}
