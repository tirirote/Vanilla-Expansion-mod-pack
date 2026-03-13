# dungeons/dagger/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Apply effects to player
effect give @s minecraft:resistance 1 0 true
effect give @s minecraft:slowness 1 0 true

# Apply knockback to mob
# Knockback {strength:-1, y:0.1}
data modify storage vexp:temp motion set value {player:"@p", distance:1.2, scale:-0.1}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_motion_by_player with storage vexp:temp motion
execute as @e[tag=vexp.hitted] run data modify entity @s Motion[1] set value 0.1d
