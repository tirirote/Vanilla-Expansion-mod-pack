effect give @s minecraft:resistance 1 1 true
effect give @s minecraft:strength 1 1 true
effect give @s minecraft:glowing 1 0 true
effect give @s minecraft:slowness 1 0 true
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.6, 0.44, 0.4], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 3}
particle flame ~ ~1 ~ .35 .35 .35 0.01 1
