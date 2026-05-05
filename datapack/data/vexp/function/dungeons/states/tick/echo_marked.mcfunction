effect give @s minecraft:slowness 2 2 true
effect give @s minecraft:blindness 2 2 true
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.65, 0.7], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 3}
particle ominous_spawning ~ ~1 ~ 0.2 0.5 0.2 0.05 1
