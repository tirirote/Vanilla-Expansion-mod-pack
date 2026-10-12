# When target hitted
# @s is the target

execute positioned ~ ~1 ~ if block ^ ^ ^-1 #replaceable positioned ~ ~-1 ~ run tp @s ^ ^ ^-1
execute positioned ~ ~1 ~ if block ^ ^ ^-2 #replaceable positioned ~ ~-1 ~ run tp @s ^ ^ ^-2
execute positioned ~ ~1 ~ if block ^ ^ ^-3 #replaceable positioned ~ ~-1 ~ run tp @s ^ ^ ^-3

particle gust ~ ~1 ~ 0.35 0.35 0.35 1 1
particle dust_color_transition{from_color:12434931,to_color:5594509,scale:2.1} ~ ~1 ~ 0.35 0.35 0.35 1 5

function vexp:utils/sound {sound: "minecraft:entity.breeze.wind_burst", type: "player", pitch:1}
