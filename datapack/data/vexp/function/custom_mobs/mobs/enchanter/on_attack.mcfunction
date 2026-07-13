# On attack custom feedback
# @s is the custom mob
execute positioned ~ ~1 ~ run particle instant_effect{color:14176699} ^ ^ ^1.5 0.1 0.1 0.1 1 3
execute positioned ~ ~1 ~ run particle instant_effect{color:13188779} ^ ^ ^2 0.1 0.1 0.1 1 2
execute positioned ~ ~1 ~ run particle instant_effect{color:12139951} ^ ^ ^2.5 0.1 0.1 0.1 1 2
execute positioned ~ ~1 ~ run particle instant_effect{color:10959271} ^ ^ ^3 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:9256599} ^ ^ ^3.5 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle instant_effect{color:7483520} ^ ^ ^4 0.1 0.1 0.1 1 1

execute positioned ~ ~1 ~ positioned ^ ^ ^1.5 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^2.5 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^3 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^3.5 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^4 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^4.5 run function vexp:utils/feedback/dust_particle {initialColor:[0.6,0.3,0.6],finalColor:[0.35,0.2,0.4],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
function vexp:utils/sound {sound: "minecraft:entity.illusioner.cast_spell", type: "player", pitch:1}
