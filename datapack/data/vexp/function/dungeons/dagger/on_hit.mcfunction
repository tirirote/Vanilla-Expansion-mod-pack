# dungeons/dagger/on_hit.mcfunction
# @s is the target entity

# Lightweight knockback
function vexp:utils/motion/apply_knockback {strength:-0.25, y:0.1}

# Visual feedback
particle minecraft:enchanted_hit ~ ~ ~ .1 .1 .1 0.2 5
function vexp:utils/sound {sound: "minecraft:item.trident.hit", type: "player"}
