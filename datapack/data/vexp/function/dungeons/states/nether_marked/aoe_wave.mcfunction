# AoE wave
particle minecraft:lava ~ ~ ~ .25 .25 .25 0.01 1
particle minecraft:flame ~ ~ ~ .5 .5 .5 0.01 1
particle flash{color:-26073} ~ ~ ~ 0 0 0 0 0
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.6, 0.44, 0.4], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 5}
function vexp:utils/sound {sound: "minecraft:block.lava.extinguish", type: "player"}

# Knockback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.2}
data modify entity @s Fire set value 40
