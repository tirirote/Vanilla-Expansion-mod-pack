# dungeons/rapier/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:0.25, y:0.2}

# Visuals
particle minecraft:enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.25 15
function vexp:utils/sound {sound: "minecraft:item.trident.hit_ground", type: "player"}