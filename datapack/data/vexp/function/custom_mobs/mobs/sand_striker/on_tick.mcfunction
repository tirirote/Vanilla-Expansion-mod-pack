# On tick hook
# @s is the custom mob
# Custom speed modifier
execute store result score @s vexp.rand run random value 0..100

execute unless block ~ ~-0.2 ~ #replaceable unless block ~ ~-0.2 ~ #sand run effect give @s slowness 1 1 true
execute if block ~ ~-0.5 ~ #sand run effect give @s speed 1 2 true

# Custom resistance on sand
execute if block ~ ~-0.5 ~ #sand run effect give @s resistance 1 3 true

# Sand feedback
execute if block ~ ~-0.5 ~ #sand run particle block{block_state:sand} ^ ^ ^0.2 0.2 0.2 0.2 0.2 1
