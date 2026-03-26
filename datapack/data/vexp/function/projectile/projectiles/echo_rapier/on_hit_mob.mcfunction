# dungeons/nether/projectile/on_hit_mob.mcfunction
# @s is the nether proj, @e[tag=vexp.proj_target] is the mob
tag @s add vexp.prevent_despawn
# Apply mark
function vexp:dungeons/states/echo_stunned
# Knockback {strength:0.5, y:0.2}
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}
particle sculk_charge_pop ~ ~ ~ .2 .2 .2 0.1 1
