#Waiting for attack
execute unless block ~ ~-1 ~ #air if block ^ ^ ^0.1 #replaceable run tp @s ^ ^0.05 ^0.1 facing entity @p[limit=1] feet

#Feedback
execute positioned ~ ~1.5 ~ positioned ^ ^ ^1.5 run function vexp:utils/feedback/dust_particle {initialColor:[0.0,0.1,0.2],finalColor:[0.2,0.5,0.35],scale:1.7,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:1}
execute positioned ~ ~1.5 ~ run particle enchanted_hit ^ ^ ^1.5 0 0 0 1 0
