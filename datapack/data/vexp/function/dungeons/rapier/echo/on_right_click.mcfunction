# dungeons/rapier/echo/on_right_click.mcfunction
# @s is the player

#
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.3, 0.5, 0.55], scale: 0.8, dX: 0.1, dY: 0.5, dZ: 0.1, speed: 0.05, count: 5}

particle minecraft:sculk_soul ~ ~ ~ 0.1 0.5 0.1 0.02 3
particle large_smoke ~ ~ ~ 0.1 0.5 0.1 0.02 5
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_sensor.clicking", type: "player"}

# Dash
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
execute if block ^ ^ ^1 #minecraft:replaceable run tp @s ^ ^-1.25 ^1
# AoE damage at end
execute as @e[type=!player,type=!item,type=!marker,distance=..3] at @s run function vexp:utils/deal_damage {damage:2, type:"minecraft:player_attack", owner:"@s"}
# Knockback {strength:1.0, y:0.2}
execute as @e[type=!player,type=!item,type=!marker,distance=..4] at @s run function vexp:utils/motion/apply_knockback {strength:2.5, y:0.2}
