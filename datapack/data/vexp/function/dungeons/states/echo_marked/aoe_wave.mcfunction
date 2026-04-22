# AoE wave
particle minecraft:trial_spawner_detection_ominous ~ ~ ~ .25 .25 .25 0.1 3
particle minecraft:glow ~ ~ ~ .5 .5 .5 0.5 3
particle flash{color:-7798795} ~ ~ ~ 0 0 0 0 0
particle squid_ink ~ ~ ~ 0.5 0.5 0.5 0.05 5
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_shrieker.break", type: "player"}

# Knockback
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.2}
