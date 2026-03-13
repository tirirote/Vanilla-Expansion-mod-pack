# dungeons/gauntlets/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-2, y:1.5}

# Visuals
particle minecraft:gust ~ ~ ~ 0 0 0 1 1
particle minecraft:cloud ~ ~ ~ 0.5 0.5 0.5 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
