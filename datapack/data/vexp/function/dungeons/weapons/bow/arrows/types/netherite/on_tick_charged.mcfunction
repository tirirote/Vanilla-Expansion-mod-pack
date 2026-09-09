# dungeons/bow/arrows/types/netherite/on_tick_charged.mcfunction
# @s is a netherite-quality bow arrow, fully charged

particle instant_effect{color:8737350,power:1} ~ ~ ~ 0 0 0 0.1 1
particle flame ~ ~ ~ 0.1 0.1 0.1 0.01 1
particle dust_color_transition{from_color:3679786,to_color:8737350,scale:1.7} ~ ~ ~ 0 0 0 0 1
