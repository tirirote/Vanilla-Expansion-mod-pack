# AoE wave
particle sculk_soul ~ ~ ~ 0.2 0.2 0.2 0.1 1
particle item{item:sculk} ~ ~ ~ .25 .25 .25 0.1 15
particle sculk_charge_pop ~ ~ ~ .2 .2 .2 0.1 15
particle flash{color:-8454162} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 10}

function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}

# Damage and tag mobs in area (2.5 blocks)
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/echo_buffed
