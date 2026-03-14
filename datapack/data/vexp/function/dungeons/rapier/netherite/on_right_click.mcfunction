# dungeons/rapier/netherite/on_right_click.mcfunction
# @s is the player

# AoE light damage and visuals
particle minecraft:flame ~ ~ ~ 0.2 0.5 0.2 0.06 3
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.4, 0.35, 0.3], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 5}
particle minecraft:lava ~ ~ ~ 0.2 0.5 0.2 0.06 3
particle large_smoke ~ ~ ~ 0.2 0.5 0.2 0.05 5
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

execute as @e[type=!player,type=!item,type=!marker,distance=..3] at @s run function vexp:utils/deal_damage {damage:2, type:"minecraft:player_attack", owner:"@s"}

# Knockback {strength:1.0, y:0.2}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/motion/apply_knockback {strength:2.5, y:0.2}

# Dash forward
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1

# Player buff
effect give @s minecraft:speed 2 1 true
