# Waiting for special attack
# @s is the custom mob
execute if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-0.01 facing entity @e[tag=vexp.mob_target,limit=1] eyes

# Feedback
execute positioned ~ ~0.45 ~ run particle dust_color_transition{from_color:14703116,to_color:4336166,scale:1.7} ^ ^ ^0.75 0.1 0.1 0.1 1 1
execute if block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.45 ~ run particle soul_fire_flame ^ ^ ^0.75 0 0 0 0 0
execute unless block ~ ~-0.5 ~ #soul_fire_base_blocks positioned ~ ~0.45 ~ run particle flame ^ ^ ^0.75 0 0 0 0 0
