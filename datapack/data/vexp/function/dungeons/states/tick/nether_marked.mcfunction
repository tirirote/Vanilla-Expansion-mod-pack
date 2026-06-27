effect give @s minecraft:slowness 3 2 true
effect give @s minecraft:weakness 3 0 true

execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 1, count: 1}
