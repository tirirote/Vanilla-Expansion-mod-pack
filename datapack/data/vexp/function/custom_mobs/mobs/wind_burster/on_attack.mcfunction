# On attack custom feedback
# @s is the custom mob
execute if block ^ ^0.1 ^-0.5 #replaceable run tp @s ^ ^0.1 ^-0.5 ~ ~-12

#Windburster attack feedback
execute positioned ~ ~1 ~ run particle gust ^ ^ ^1 1 1 1 1 0
execute positioned ~ ~1 ~ run particle small_gust ^ ^ ^1 0.2 0.2 0.2 1 3
execute positioned ~ ~1 ~ run particle small_gust ^ ^ ^2 0.2 0.2 0.2 1 3
execute positioned ~ ~1 ~ run particle small_gust ^ ^ ^3 0.2 0.2 0.2 1 3
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:12434931,to_color:5594509,scale:1.7} ^ ^ ^1 0.35 0.35 0.35 1 1
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:12434931,to_color:5594509,scale:1.7} ^ ^ ^2 0.35 0.35 0.35 1 1
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:12434931,to_color:5594509,scale:1.7} ^ ^ ^3 0.35 0.35 0.35 1 1
