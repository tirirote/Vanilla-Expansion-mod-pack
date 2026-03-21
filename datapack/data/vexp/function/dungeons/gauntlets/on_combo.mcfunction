# dungeons/gauntlets/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-2.5, y:2.5}

# Visuals
particle minecraft:gust ~ ~ ~ 0 0 0 1 1
particle minecraft:crit ~ ~ ~ .25 .25 .25 0.05 10
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
