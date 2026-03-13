# dungeons/gauntlets/echo/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark corruption
execute as @e[tag=vexp.hitted] run function vexp:dungeons/states/echo_marked

# Effects
execute as @e[tag=vexp.hitted] run effect give @s minecraft:slowness 2 0 true

# Knockback {strength:0.25, y:0.2}
data modify storage vexp:temp motion set value {strength:0.25, y:0.2}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion

