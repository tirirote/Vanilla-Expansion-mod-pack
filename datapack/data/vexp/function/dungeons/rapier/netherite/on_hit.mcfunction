# @s is the player, @e[tag=vexp.hitted] is the mob

# Knockback {strength:-2.5, y:0.1}
data modify storage vexp:temp motion set value {player:"@p", distance:1.2, scale:-0.25}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_motion_by_player with storage vexp:temp motion
execute as @e[tag=vexp.hitted] run data modify entity @s Motion[1] set value 0.1d
