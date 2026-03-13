# dungeons/dagger/amethyst/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Player speed
effect give @s minecraft:speed 2 0 true

# Knockback {0.5, 0.1}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_motion_by_player {player:"@p", distance:1.2, scale:0.05}
execute as @e[tag=vexp.hitted] run data modify entity @s Motion[1] set value 0.1d
