# dungeons/armor/types/glowing/on_hurt.mcfunction
# Triggered when player is damaged.

# Random buff
execute if score @s vexp.armor_rand matches -450..450 run function vexp:dungeons/states/glow_buffed
