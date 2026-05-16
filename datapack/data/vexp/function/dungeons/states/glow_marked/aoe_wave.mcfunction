# AoE wave
particle flash{color:-6488120} ~ ~ ~ 0 0 0 0 0
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 2.8, dX: .5, dY: .5, dZ: .5, speed: 1, count: 5}
particle glow ~ ~ ~ 0.5 0.5 0.5 0 3

function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:utils/motion/apply_knockback {strength:-2.0, y:0.1}
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/states/glow_confused
