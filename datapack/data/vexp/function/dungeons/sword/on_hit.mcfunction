# dungeons/sword/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
particle minecraft:crit ~ ~1 ~ .2 .2 .2 0.05 5
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
