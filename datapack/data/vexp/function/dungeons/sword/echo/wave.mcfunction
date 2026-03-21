# AoE wave
particle minecraft:sculk_soul ~ ~1 ~ 0.5 0.2 0.5 0.02 5
particle minecraft:large_smoke ~ ~1 ~ 0.5 0.2 0.5 0.02 5
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.65, 0.7], scale: 1.7, dX: 0.5, dY: 0.2, dZ: 0.5, speed: 0.05, count: 10}
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player"}
# Damage and tag mobs in area (5 blocks)
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:dungeons/states/echo_marked
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run function vexp:utils/motion/apply_knockback {strength:-1, y:0.25}
