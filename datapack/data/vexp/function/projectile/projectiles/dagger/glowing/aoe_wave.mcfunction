# AoE wave
particle glow ~ ~ ~ .2 .2 .2 0.01 10
particle glow_squid_ink ~ ~ ~ .2 .2 .2 0.1 5
particle flash{color:-6488120} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.2, 0.3], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 10}

function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}

# Damage and tag mobs in area (2.5 blocks)
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/glow_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/glow_buffed
