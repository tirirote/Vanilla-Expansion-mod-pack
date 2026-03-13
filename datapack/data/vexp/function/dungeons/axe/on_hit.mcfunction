# @s is the target entity

# Slight pushback
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.2}

# Visuals
particle minecraft:crit ~ ~ ~ .2 .2 .2 .2 15
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}