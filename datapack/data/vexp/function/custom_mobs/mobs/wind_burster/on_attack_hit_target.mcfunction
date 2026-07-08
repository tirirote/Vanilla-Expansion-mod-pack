# When target hitted
# @s is the target

execute positioned ~ ~1 ~ if block ^ ^ ^-1 #replaceable positioned ~ ~-1 ~ run tp @s ^ ^ ^-1
execute positioned ~ ~1 ~ if block ^ ^ ^-2 #replaceable positioned ~ ~-1 ~ run tp @s ^ ^ ^-2
execute positioned ~ ~1 ~ if block ^ ^ ^-3 #replaceable positioned ~ ~-1 ~ run tp @s ^ ^ ^-3

particle gust ~ ~1 ~ 0.35 0.35 0.35 1 1
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.5,0.6,0.7],finalColor:[0.6,0.85,0.9],scale:2.1,dX:0.35,dY:0.35,dZ:0.35,speed:1,count:5}

function vexp:utils/sound {sound: "minecraft:entity.breeze.wind_burst", type: "player"}
