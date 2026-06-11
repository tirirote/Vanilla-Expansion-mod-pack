#On special attack
execute unless block ~ ~-1 ~ #air if block ^ ^ ^-0.25 #replaceable run tp @s ^ ^0.1 ^-0.25 ~ ~12

#Hollow attack feedback
execute positioned ~ ~1 ~ run particle flash{color:-15956068} ^ ^ ^1 1 1 1 1 0

execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^1 0.2 0.2 0.2 0.5 10
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^2 0.2 0.2 0.2 0.5 10
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^3 0.2 0.2 0.2 0.5 8
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^4 0.2 0.2 0.2 0.5 8
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^5 0.2 0.2 0.2 0.5 5
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^6 0.2 0.2 0.2 0.5 5
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^7 0.2 0.2 0.2 0.5 3

execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^1 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^2 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^3 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^4 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^5 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^6 0.1 0.1 0.1 1 1
execute positioned ~ ~1 ~ run particle ominous_spawning ^ ^ ^7 0.1 0.1 0.1 1 1

execute positioned ~ ~1 ~ positioned ^ ^ ^1 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.3,dY:0.3,dZ:0.3,speed:1,count:5}
execute positioned ~ ~1 ~ positioned ^ ^ ^2 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.3,dY:0.3,dZ:0.3,speed:1,count:4}
execute positioned ~ ~1 ~ positioned ^ ^ ^3 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:4}
execute positioned ~ ~1 ~ positioned ^ ^ ^4 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^5 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.1,dY:0.1,dZ:0.1,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^6 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.1,dY:0.1,dZ:0.1,speed:1,count:3}
execute positioned ~ ~1 ~ positioned ^ ^ ^7 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.1,dY:0.1,dZ:0.1,speed:1,count:2}

function vexp:utils/sound {sound: "minecraft:entity.wither.shoot", type: "player"}
