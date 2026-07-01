# Waiting for special attack
# @s is the custom mob
particle small_gust ~ ~0.5 ~ 0.2 0.2 0.2 0 1
execute if block ^ ^1 ^-1 #replaceable run tp @s ^ ^0.01 ^-0.02 facing entity @p[limit=1]
