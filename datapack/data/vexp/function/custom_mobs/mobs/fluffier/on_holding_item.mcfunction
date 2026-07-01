# When holding item hook
# @s is the custom mob
execute if entity @p[distance=3.5..24] if block ^ ^ ^1 #replaceable unless block ~ ~-3 ~ #air run tp @s ^ ^0.05 ^0.1 facing entity @p[limit=1]
