effect give @s minecraft:slowness 1 1 true
effect give @s minecraft:weakness 1 1 true
effect give @s minecraft:blindness 1 1 true
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.65, 0.7], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 1}
particle ominous_spawning ~ ~1 ~ 0.2 0.5 0.2 0.05 1
