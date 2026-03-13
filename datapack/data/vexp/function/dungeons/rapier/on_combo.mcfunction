# dungeons/rapier/on_combo.mcfunction
# @s is the target entity

# Strong push away for the mob
function vexp:utils/motion/apply_knockback {strength:-3, y:0.2}

# Visuals
particle minecraft:flash{color:-1} ~ ~ ~ 0 0 0 1 1
particle minecraft:gust ~ ~ ~ 0 0 0 1 1
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}