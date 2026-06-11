#On attack custom feedback

#Windburster attack feedback
execute positioned ~ ~1 ~ run particle gust ^ ^ ^1 1 1 1 1 0
execute positioned ~ ~1 ~ run particle small_gust ^ ^ ^1 0.2 0.2 0.2 1 3
execute positioned ~ ~1 ~ run particle small_gust ^ ^ ^2 0.2 0.2 0.2 1 3
execute positioned ~ ~1 ~ run particle small_gust ^ ^ ^3 0.2 0.2 0.2 1 3
execute positioned ~ ~1 ~ positioned ^ ^ ^1 run function vexp:utils/feedback/dust_particle {initialColor:[0.5,0.6,0.7],finalColor:[0.6,0.85,0.9],scale:2.1,dX:1,dY:0.2,dZ:1,speed:1,count:1}
execute positioned ~ ~1 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor:[0.5,0.6,0.7],finalColor:[0.6,0.85,0.9],scale:2.1,dX:1,dY:0.2,dZ:1,speed:1,count:1}
execute positioned ~ ~1 ~ positioned ^ ^ ^3 run function vexp:utils/feedback/dust_particle {initialColor:[0.5,0.6,0.7],finalColor:[0.6,0.85,0.9],scale:2.1,dX:1,dY:0.2,dZ:1,speed:1,count:1}
