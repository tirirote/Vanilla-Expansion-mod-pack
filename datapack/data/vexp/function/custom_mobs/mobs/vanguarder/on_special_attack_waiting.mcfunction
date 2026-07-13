# Waiting for special attack
# @s is the custom mob
execute unless block ~ ~-1 ~ #air if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-0.01 facing entity @p[limit=1]
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.2,0.4,0.5],finalColor:[0.4,0.6,0.5],scale:0.8,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:1}
