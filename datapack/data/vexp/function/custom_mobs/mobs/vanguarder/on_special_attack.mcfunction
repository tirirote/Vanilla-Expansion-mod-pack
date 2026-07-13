# On special attack feedback hook
# @s is the custom mob
execute positioned ^ ^1 ^1 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
execute positioned ^ ^1 ^2 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^
execute positioned ^ ^1 ^3 if block ^ ^ ^ #replaceable run tp @s ^ ^ ^

execute positioned ~ ~1 ~ run particle block{block_state:"tuff_bricks"} ^ ^ ^0.5 0.2 0.2 0.2 0.35 10
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor:[0.2,0.4,0.5],finalColor:[0.4,0.6,0.5],scale:1.7,dX:0.2,dY:0.2,dZ:0.2,speed:1,count:5}
