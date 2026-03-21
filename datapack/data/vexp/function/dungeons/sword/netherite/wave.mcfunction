# AoE wave
particle minecraft:lava ~ ~ ~ 1 0.2 1 0 3
particle flame ~ ~ ~ 1 0.2 1 0.05 5
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.5, 0.45, 0.35], scale: 1.7, dX: 1, dY: 0.2, dZ: 1, speed: 0.05, count: 15}
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
# Damage and tag mobs in area (5 blocks)
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:dungeons/states/nether_marked
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

