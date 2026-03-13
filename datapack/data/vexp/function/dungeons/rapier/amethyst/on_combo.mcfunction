# dungeons/rapier/amethyst/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Effects
execute as @e[tag=vexp.hitted] run effect give @s minecraft:levitation 1 10 true

# Knockback {-2.5, 0.25} -> Pull
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_motion_by_player {player:"@p", distance:1.2, scale:-0.25}
execute as @e[tag=vexp.hitted] run data modify entity @s Motion[1] set value 0.25d

# Player speed
effect give @s minecraft:speed 2 1 true
