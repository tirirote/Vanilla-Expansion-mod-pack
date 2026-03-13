# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Player effects
effect give @s minecraft:resistance 1 0 true
effect give @s minecraft:slowness 1 0 true

# Mob effects
execute as @e[tag=vexp.hitted] run effect give @s minecraft:slowness 2 1 true

# Knockback {strength:1.0, y:0.2}
data modify storage vexp:temp motion set value {strength:1.0, y:0.2}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion


