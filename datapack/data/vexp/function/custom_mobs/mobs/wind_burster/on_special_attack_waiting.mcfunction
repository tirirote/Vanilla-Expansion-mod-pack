# Waiting for special attack
# @s is the custom mob
execute if score #windbreaker_random_movement vexp.math matches ..49 if entity @e[type=#illager,sort=nearest,limit=1,distance=..16] unless block ^ ^-2 ^-0.35 #replaceable run tp @s ^ ^0.05 ^-0.35 ~-8 ~
execute if score #windbreaker_random_movement vexp.math matches 50.. if entity @e[type=#illager,sort=nearest,limit=1,distance=..16] unless block ^ ^-2 ^-0.35 #replaceable run tp @s ^ ^0.05 ^0.35 ~8 ~
