tag @s add vexp.prevent_despawn

execute as @e[predicate=vexp:is_target,distance=..1] at @s run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}
