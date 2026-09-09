# dungeons/bow/arrows/types/diamond/on_tick_charged.mcfunction
# @s is a diamond-quality bow arrow, fully charged

particle instant_effect{color:3788726,power:1} ~ ~ ~ 0 0 0 0.1 1
particle enchanted_hit ~ ~ ~ 0 0 0 .1 1
particle dust_color_transition{from_color:3788726,to_color:36214,scale:0.8} ~ ~ ~ 0 0 0 0 1
