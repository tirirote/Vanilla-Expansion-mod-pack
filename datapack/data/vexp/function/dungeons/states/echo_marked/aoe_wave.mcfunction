# AoE wave
particle minecraft:sculk_soul ~ ~.1 ~ 1 0.2 1 0.02 13
particle minecraft:ominous_spawning ~ ~.1 ~ 1 0.2 1 0.05 15
particle flash{color:-16719361} ~ ~.1 ~ 0 0 0 0 1
particle soul_fire_flame ~ ~.1 ~ 1 0.2 1 0.02 3
execute positioned ~ ~.1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.65, 0.7], scale: 1.7, dX: 1, dY: 0.2, dZ: 1, speed: 0.05, count: 10}
function vexp:utils/sound {sound: "minecraft:entity.warden.roar", type: "player"}
# Knockback
# Damage and tag mobs in area (5 blocks)
execute as @e[type=!player,type=!item,type=!marker,distance=..2.5] at @s run damage @s 2 magic by @p[tag=vexp.attacker,limit=1]
