# AoE wave
particle lava ~ ~1 ~ .5 .5 .5 0.01 1
particle flash{color:-26073} ~ ~1 ~ 0 0 0 0 0
particle falling_lava ~ ~1 ~ 0.35 0.35 0.35 0.5 5
particle explosion ~ ~1 ~ 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:entity.generic.explode", type: "player"}

# Knockback
function vexp:utils/motion/apply_knockback {strength:-1.0, y:0.2}
data modify entity @s Fire set value 40
