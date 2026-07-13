# On tick hook
# @s is the custom mob

# Custom speed modifier
execute if block ~ ~-0.2 ~ #soul_speed_blocks run effect give @s speed 2 1 true
execute unless block ~ ~-0.2 ~ #soul_speed_blocks run effect give @s slowness 1 1 true

# Sand feedback
execute if block ~ ~-0.2 ~ #soul_speed_blocks run particle block{block_state:soul_sand} ^ ^ ^0.2 0.2 0.2 0.2 0.05 1

# Data mod
execute if data entity @s Fire run data modify entity @s Fire set value 0
