# dungeons/bow/arrows/types/gold/on_tick_charged.mcfunction
# @s is a gold-quality bow arrow, fully charged

particle instant_effect{color:16383904,power:1} ~ ~ ~ 0 0 0 0.1 1
particle instant_effect{color:16763188,power:1} ~ ~ ~ 0 0 0 0.1 1
particle dust_color_transition{from_color:16383904,to_color:16763188,scale:0.8} ~ ~ ~ 0 0 0 0 1
