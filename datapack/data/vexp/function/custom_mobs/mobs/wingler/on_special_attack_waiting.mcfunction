# Waiting for special attack
# @s is the custom mob
execute unless block ~ ~-5 ~ #replaceable run tp @s ^ ^0.2 ^-0.1 facing entity @e[tag=vexp.mob_target,sort=nearest,limit=1] feet
particle small_gust ~ ~0.5 ~ 0.2 0.2 0.2 0 1
