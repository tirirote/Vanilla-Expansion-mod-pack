effect give @s minecraft:resistance 1 1 true
effect give @s minecraft:strength 1 0 true
effect give @s minecraft:glowing 1 0 true
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
particle trial_spawner_detection ~ ~1 ~ .25 .25 .25 0.01 1
