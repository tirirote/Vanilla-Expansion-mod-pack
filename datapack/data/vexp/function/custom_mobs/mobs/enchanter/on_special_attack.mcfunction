# On special attack feedback hook
# @s is the custom mob
# Buff friend illagers
execute as @e[type=#illager_friends,distance=..12] at @s run function vexp:dungeons/states/enchanter_buff
execute as @e[type=#illager_friends,distance=..12] at @s run particle instant_effect{color:14176699} ~ ~ ~ 0.2 0.2 0.2 1 15
execute as @e[type=#illager_friends,distance=..12] at @s run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:1.7,dX:1,dY:0.2,dZ:1,speed:1,count:15}

tag @s remove vexp.enchanter_ready

#Feedback
function vexp:utils/sound {sound: "minecraft:entity.illusioner.prepare_mirror", type: "player", pitch:1}
