# On special attack feedback hook
# @s is the custom mob
execute as @e[type=#illager,distance=..4.5] at @s unless block ~ ~-0.25 ~ #replaceable run function vexp:custom_mobs/mobs/wind_burster/illager_fly_buff

#Windburster Special Attack Feedback
particle flash{color:-6635297} ~ ~1 ~ 1 1 1 1 0
particle gust ~ ~1 ~ 1 0.2 1 1 5
particle dust_color_transition{from_color:12434931,to_color:5594509,scale:2.1} ~ ~1 ~ 0.35 0.35 0.35 1 5

function vexp:utils/sound {sound: "minecraft:entity.breeze.wind_burst", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.evoker.celebrate", type: "player", pitch:1}
