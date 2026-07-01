# Custom aggro hook
# @s is the custom mob

# Search for player
execute if block ~ ~-0.2 ~ #soul_speed_blocks if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.6 facing entity @p[limit=1] feet
execute unless block ~ ~-0.2 ~ #soul_speed_blocks unless block ~ ~-0.2 ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.3 facing entity @p[limit=1] feet
