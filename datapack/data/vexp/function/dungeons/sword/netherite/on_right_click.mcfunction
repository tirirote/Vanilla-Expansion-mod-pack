# dungeons/sword/netherite/on_right_click.mcfunction
# @s is the player

# AoE wave
execute positioned ~ ~-1.5 ~ run function vexp:utils/feedback/dust_wave_custom {initialColor:[0.2,0.2,0.2],finalColor:[0.5,0.4,0.3],scale:2.1}

particle minecraft:lava ~ ~-1.5 ~ 1 0.2 1 0 5
particle flame ~ ~-1.5 ~ 1 0.2 1 0.05 5
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

execute as @e[type=!player,type=!item,type=!marker,distance=..5] at @s run function vexp:utils/motion/apply_knockback {strength:1.5, y:0.1}

# Damage and tag mobs in area (5 blocks)
execute as @e[type=!player,type=!item,type=!marker,distance=..5] at @s run function vexp:dungeons/states/nether_marked
# Pull {strength:-3.0, y:0.1}
data modify storage vexp:temp motion set value {strength:-3.0, y:0.1}
execute as @e[type=!player,type=!item,type=!marker,distance=..5] at @s run function vexp:utils/motion/apply_knockback with storage vexp:temp motion

# Player buff
effect give @s minecraft:resistance 2 1 true
