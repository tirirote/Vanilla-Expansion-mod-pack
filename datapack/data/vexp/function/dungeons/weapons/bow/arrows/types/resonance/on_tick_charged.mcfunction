# dungeons/bow/arrows/types/resonance/on_tick_charged.mcfunction
# @s is a resonance-quality bow arrow, fully charged

particle sculk_charge_pop ~ ~ ~ 0 0 0 0.02 1
particle instant_effect{color:668982,power:1} ~ ~ ~ 0 0 0 0.1 1
particle dust_color_transition{from_color:668982,to_color:6815730,scale:1.7} ~ ~ ~ 0 0 0 0 1
