effect give @s minecraft:darkness 2 2 true
effect give @s minecraft:blindness 2 2 true
effect give @s weakness 2 2 true
effect give @s mining_fatigue 2 2 true

execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: .2, dY: .5, dZ: .2, speed: 1, count: 1}
particle item{item:sculk} ~ ~1 ~ .1 .5 .1 0 1
