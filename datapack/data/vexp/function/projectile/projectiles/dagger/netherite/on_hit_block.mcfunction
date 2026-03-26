# Netherite projectile hook on block hit
function vexp:dungeons/dagger/projectile/netherite/aoe_wave

execute as @e[type=!player,type=!item,type=!marker,distance=..5] at @s run function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}
