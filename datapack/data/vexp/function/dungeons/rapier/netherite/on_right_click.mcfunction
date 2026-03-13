# dungeons/rapier/netherite/on_right_click.mcfunction
# @s is the player

# Dash forward
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^ ^1

# AoE light damage and visuals
particle minecraft:flame ~ ~1 ~ 1 0.5 1 0.1 20
data modify storage vexp:temp damage set value {damage:2, type:"minecraft:player_attack", owner:"@s"}
execute as @e[type=!player,type=!item,type=!marker,distance=..3] at @s run function vexp:utils/deal_damage with storage vexp:temp damage

# Knockback {strength:1.0, y:0.2}
data modify storage vexp:temp motion set value {strength:1.0, y:0.2}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion


# Player buff
effect give @s minecraft:speed 2 1 true
