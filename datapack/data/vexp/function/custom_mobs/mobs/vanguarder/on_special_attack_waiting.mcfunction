# Waiting for special attack
# @s is the custom mob
execute unless block ~ ~-1 ~ #air if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-0.1 facing entity @p[limit=1]
particle enchanted_hit ~ ~1 ~ 0.35 0.35 0.35 0.01 1
