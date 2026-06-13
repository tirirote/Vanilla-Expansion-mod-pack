# Custom on hurt tick hook
# @s is the custom mob
execute unless block ^ ^-2.5 ^1 #replaceable run tp @s ^ ^0.02 ^1 facing entity @e[type=#illager,sort=arbitrary,limit=1,distance=..16]
