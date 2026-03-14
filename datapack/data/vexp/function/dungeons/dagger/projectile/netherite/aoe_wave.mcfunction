# AoE wave
particle minecraft:lava ~ ~ ~ .2 0 .2 0 3
particle minecraft:large_smoke ~ ~ ~ 0.5 0.2 0.5 0.1 10
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
# Damage and tag mobs in area (2.5 blocks)
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:dungeons/states/nether_marked
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
