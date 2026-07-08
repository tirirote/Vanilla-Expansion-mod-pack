# Custom aggro hook
# @s is the custom mob

# Speed modifier
execute if block ~ ~ ~ #soul_speed_blocks run effect give @s speed 2 0 true
execute unless block ~ ~ ~ #soul_speed_blocks unless block ~ ~ ~ #replaceable run effect give @s slowness 2 0 true
