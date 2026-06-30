# On pickup try custom hook
# @s is the custom mob

# Try to pickup item
execute unless entity @p[distance=..6] unless block ~ ~-1 ~ #air if block ^ ^0.5 ^0.5 #replaceable run tp @s ^ ^0.1 ^0.5 facing entity @e[type=item,sort=nearest,limit=1]

execute unless entity @p[distance=..6] run particle composter ~ ~ ~ 0.2 0.2 0.2 0 1
