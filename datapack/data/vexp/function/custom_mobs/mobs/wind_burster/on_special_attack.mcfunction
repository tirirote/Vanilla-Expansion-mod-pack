# On special attack feedback hook
# @s is the custom mob
execute as @e[type=#illager,distance=..4.5] at @s unless block ~ ~-0.25 ~ #replaceable run function vexp:custom_mobs/mobs/wind_burster/illager_fly_buff

#Windburster Special Attack Feedback
particle flash{color:-6635297} ~ ~1 ~ 1 1 1 1 0
particle gust ~ ~1 ~ 1 0.2 1 1 5
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.5,0.6,0.7],finalColor:[0.6,0.85,0.9],scale:2.1,dX:1,dY:0.2,dZ:1,speed:1,count:10}

function vexp:utils/sound {sound: "minecraft:entity.breeze.wind_burst", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.evoker.celebrate", type: "player"}
