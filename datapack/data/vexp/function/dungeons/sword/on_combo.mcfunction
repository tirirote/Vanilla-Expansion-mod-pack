# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Visuals
particle minecraft:enchanted_hit ~ ~1 ~ .2 .2 .2 0.05 5
particle minecraft:end_rod ~ ~1 ~ .2 .2 .2 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
