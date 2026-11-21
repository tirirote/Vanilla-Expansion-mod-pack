# dungeons/armor/types/glowing/on_sprint.mcfunction
# Triggered when player sprints.

# Random buff
execute if score @s vexp.armor_rand matches -5..5 run function vexp:dungeons/states/glow_buffed

particle squid_ink ~ ~1 ~ 0.2 0.2 0.2 0.02 1
particle glow ~ ~1 ~ 0.2 0.2 0.2 0.02 1
