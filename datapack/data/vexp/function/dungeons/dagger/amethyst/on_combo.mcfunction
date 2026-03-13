# dungeons/dagger/amethyst/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Levitation and Knockback {-2.5, 0.25}
execute as @e[tag=vexp.hitted] run effect give @s minecraft:levitation 1 5 true
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_motion_by_player {player:"@p", distance:1.2, scale:-0.25}
execute as @e[tag=vexp.hitted] run data modify entity @s Motion[1] set value 0.25d
