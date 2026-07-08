#Waiting for attack
execute unless block ~ ~-0.5 ~ #air if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-0.1 facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1]
#Feedback
execute positioned ~ ~1 ~ run particle instant_effect{color:1668607} ^ ^ ^0.5 0.2 0.2 0.2 0 1
execute positioned ~ ~1 ~ run particle enchanted_hit ^ ^ ^0.5 0.2 0.2 0.2 0 1
