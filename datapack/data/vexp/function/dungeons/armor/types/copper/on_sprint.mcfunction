# dungeons/armor/types/copper/on_sprint.mcfunction
# Triggered when player is sprinting (per sprint pulse)

# Chance to deal thunder damage?
execute if score @s vexp.armor_rand matches -5..5 run function vexp:dungeons/armor/types/copper/thunder_wave
