# On tick hook
# @s is the custom mob

execute store result score #mothling_movement vexp.math run random value 0..100

# Custom speed modifier
execute if block ~ ~-0.2 ~ #soul_speed_blocks run effect give @s speed 1 1 true
execute unless block ~ ~-0.2 ~ #soul_speed_blocks run effect give @s slowness 1 1 true

# Sand feedback
execute if block ~ ~-0.2 ~ #soul_speed_blocks run particle block{block_state:soul_sand} ^ ^ ^0.2 0.2 0.2 0.2 0.05 1

# Search for player
execute unless entity @s[tag=vexp.mob_special_ready] unless entity @s[tag=vexp.mob_attack_done] if entity @p[distance=1..12] if score #mothling_movement vexp.math matches 40.. if block ~ ~-0.2 ~ #soul_speed_blocks if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.6 facing entity @p[limit=1] feet
execute unless entity @s[tag=vexp.mob_special_ready] unless entity @s[tag=vexp.mob_attack_done] if entity @p[distance=1..12] if score #mothling_movement vexp.math matches 40.. unless block ~ ~-0.2 ~ #soul_speed_blocks unless block ~ ~-0.2 ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.3 facing entity @p[limit=1] feet

# Data mod
execute if data entity @s InLove run data modify entity @s InLove set value 0
execute if data entity @s Fire run data modify entity @s Fire set value 0
