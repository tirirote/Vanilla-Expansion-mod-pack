# Knockback: empuje adicional desde el atacante.

execute if score @s vexp.enchant.knockback matches 1 as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback {strength:-2.0, y:0.2}
execute if score @s vexp.enchant.knockback matches 2.. as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback {strength:-3.2, y:0.25}

# Feedback
execute as @e[tag=vexp.hitted] at @s run function vexp:dungeons/fx/enchantments/knockback
