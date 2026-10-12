# On special attack feedback hook
# @s is the custom mob
execute positioned ^ ^1 ^1 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
execute positioned ^ ^1 ^2 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
execute positioned ^ ^1 ^3 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^

execute positioned ~ ~1 ~ run particle block{block_state:"tuff_bricks"} ^ ^ ^0.5 0.2 0.2 0.2 0.35 10
particle dust_color_transition{from_color:8359329,to_color:5397865,scale:1.7} ~ ~1 ~ 0.2 0.2 0.2 1 5
