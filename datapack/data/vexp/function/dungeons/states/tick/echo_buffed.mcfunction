effect give @s minecraft:speed 2 2 true
effect give @s haste 2 2 true
effect give @s minecraft:glowing 1 0 true
effect give @s slow_falling 2 0 true
effect give @s jump_boost 2 2 true
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.65, 0.7], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 1}
particle minecraft:ominous_spawning ~ ~1 ~ .2 .2 .2 0.2 1
