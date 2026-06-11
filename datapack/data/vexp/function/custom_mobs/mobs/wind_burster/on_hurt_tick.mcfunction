#Custom on hurt hook
execute unless block ^ ^-2 ^1 #replaceable run tp @s ^ ^0.1 ^1 facing entity @e[type=#illager,sort=nearest,limit=1,distance=..16]
