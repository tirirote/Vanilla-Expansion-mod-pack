# dungeons/armor/types/resonance/on_sprint.mcfunction
# Triggered when player is sprinting (per sprint pulse)
particle sculk_charge_pop ~ ~1 ~ 0.2 0.5 0.2 0.05 1
execute positioned ~ ~1 ~ run particle dust_color_transition{from_color:668982,to_color:6815730,scale:0.8} ~ ~ ~ 0.2 0.2 0.2 1 3
