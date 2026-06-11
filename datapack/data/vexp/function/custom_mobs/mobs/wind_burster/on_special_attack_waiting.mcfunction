#Waiting for attack
execute if entity @e[type=#illager,sort=nearest,limit=1,distance=..16] unless block ^ ^-2 ^-0.2 #replaceable run tp @s ^ ^0.1 ^-0.35
particle small_gust ~ ~.5 ~ 0.5 0.2 0.5 0 1
