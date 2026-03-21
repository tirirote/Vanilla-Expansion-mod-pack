# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.25}

# Visuals
particle minecraft:enchanted_hit ~ ~1 ~ .25 .25 .25 0.2 10
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
