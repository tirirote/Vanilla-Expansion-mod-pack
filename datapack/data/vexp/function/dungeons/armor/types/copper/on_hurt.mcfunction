# dungeons/armor/types/copper/on_hurt.mcfunction
# Triggered when player takes damage

# Chance to deal thunder damage?
execute if score @s vexp.armor_rand matches -350..350 run function vexp:dungeons/armor/types/copper/thunder_wave
