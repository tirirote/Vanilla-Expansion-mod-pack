# dungeons/scythe/netherite/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
execute as @e[tag=vexp.hitted] run function vexp:dungeons/states/nether_marked
execute as @e[tag=vexp.hitted] run effect give @s minecraft:slowness 2 2 true

# Knockback {strength:-4.0, y:0.1}
data modify storage vexp:temp motion set value {strength:-4.0, y:0.1}
execute as @e[tag=vexp.hitted] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion

