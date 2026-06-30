# Custom aggro hook
# @s is the custom mob
execute unless block ~ ~-3 ~ #air if block ^ ^ ^0.5 #replaceable run tp @s ^ ^0.1 ^0.3 facing entity @p[limit=1,distance=2.5..6] eyes
