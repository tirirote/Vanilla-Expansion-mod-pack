# Thrust wave - spear common
#Knockback
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.1}

# Visuals
particle crit ~ ~1 ~ 0.35 0.35 0.35 0.5 15
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}
