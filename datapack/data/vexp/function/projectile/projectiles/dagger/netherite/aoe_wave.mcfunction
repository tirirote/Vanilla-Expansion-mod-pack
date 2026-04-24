# AoE wave
particle minecraft:lava ~ ~ ~ .2 .2 .2 0 1
particle trial_spawner_detection ~ ~ ~ .2 .2 .2 0.01 10
particle large_smoke ~ ~ ~ .2 .2 .2 0.05 5
particle flash{color:-28360} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 10}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
# Damage and tag mobs in area (2.5 blocks)
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/nether_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
