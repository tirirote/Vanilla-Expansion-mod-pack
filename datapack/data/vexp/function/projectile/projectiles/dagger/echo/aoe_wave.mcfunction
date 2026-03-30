# AoE wave
particle minecraft:shriek{delay:0} ~ ~ ~ 0 0 0 0 0
particle minecraft:large_smoke ~ ~ ~ 0.5 0.2 0.5 0.1 10

particle minecraft:sculk_charge_pop ~ ~ ~ 0.5 0.2 0.5 0.05 10
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
# Damage and tag mobs in area (2.5 blocks)
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
