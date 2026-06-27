effect give @s blindness 15 3 true
effect give @s darkness 15 3 true

execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 0.8, dX: .2, dY: .5, dZ: .2, speed: 1, count: 1}
