# AoE wave
particle minecraft:lava ~ ~ ~ 1 0.2 1 0 1
particle flame ~ ~ ~ 1 0.2 1 0.05 3
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
# Damage and tag mobs in area (5 blocks)
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:dungeons/states/nether_marked
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

