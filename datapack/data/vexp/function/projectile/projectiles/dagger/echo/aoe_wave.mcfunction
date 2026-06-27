# AoE wave
function vexp:dungeons/fx/aeo_waves/echo


# Damage and tag mobs in area (2.5 blocks)
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

execute as @p[tag=vexp.dagger_owner,limit=1] run function vexp:dungeons/states/echo_buffed
