# dungeons/combo_system/hooks/on_swoosh.mcfunction
# @s is the player
# Base generic swoosh. Future quality/item hooks can replace this callsite.

# Pitch discarded: orientation is yaw-only for cleaner visuals.
# Symmetric textures remove the need for trail mirroring.
function vexp:utils/feedback/swoosh/spawn_trail {item_id:"minecraft:firework_rocket",model:"vexp:swoosh"}

#Particles
particle minecraft:entity_effect{color:1660944383} ~ ~1.5 ~ 0.0 0.0 0.0 0 0
