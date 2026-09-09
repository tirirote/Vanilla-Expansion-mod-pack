# Common spell
execute if score @s vexp.hit_delay matches 5 run particle dust_color_transition{from_color:13619635,to_color:10723459,scale:0.4} ~ ~ ~ 0.02 0.02 0.02 0 8
execute if score @s vexp.hit_delay matches 4 run particle dust_color_transition{from_color:13619635,to_color:10723459,scale:0.8} ~ ~ ~ 0.04 0.04 0.04 0 6
execute if score @s vexp.hit_delay matches 3 run particle dust_color_transition{from_color:13619635,to_color:10723459,scale:1.2} ~ ~ ~ 0.08 0.08 0.08 0 3
execute if score @s vexp.hit_delay matches 2 run particle dust_color_transition{from_color:13619635,to_color:10723459,scale:1.3} ~ ~ ~ 0.12 0.12 0.12 0 2
execute if score @s vexp.hit_delay matches 1 run particle dust_color_transition{from_color:13619635,to_color:10723459,scale:1.7} ~ ~ ~ 0.15 0.15 0.15 0 1
execute if score @s vexp.hit_delay matches 1 run particle instant_effect{color:13619635,power:1} ~ ~ ~ 0.2 0.2 0.2 0 3
execute if score @s vexp.hit_delay matches 1 run particle item{item:bone} ~ ~ ~ 0.2 0.2 0.2 0.02 3
