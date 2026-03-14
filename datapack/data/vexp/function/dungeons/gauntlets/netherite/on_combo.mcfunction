# AoE wave
execute positioned ~ ~-1.5 ~ run function vexp:dungeons/dagger/projectile/netherite/aoe_wave

execute as @e[type=!player,type=!item,type=!marker,distance=..5] at @s run function vexp:utils/motion/apply_knockback {strength:-1, y:0.1}

# Player buff
effect give @s minecraft:resistance 2 1 true
