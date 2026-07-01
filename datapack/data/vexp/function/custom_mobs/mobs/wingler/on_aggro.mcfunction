# Custom aggro hook
# @s is the custom mob
execute unless block ~ ~-1 ~ #air if block ^ ^ ^0.5 #replaceable run tp @s ^ ^0.05 ^0.6 facing entity @p[limit=1,distance=2.5..6] eyes
