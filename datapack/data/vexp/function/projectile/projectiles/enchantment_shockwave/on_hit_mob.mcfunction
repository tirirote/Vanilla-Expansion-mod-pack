tag @s add vexp.prevent_despawn

particle flash{color:-16759553} ~ ~ ~ 1 1 1 1 0
particle flash{color:-16711694} ~ ~ ~ 1 1 1 1 0
particle electric_spark ~ ~ ~ 1 0.5 1 0.5 5

execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}
