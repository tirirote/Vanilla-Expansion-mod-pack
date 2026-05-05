effect give @s minecraft:slowness 1 2 true
data modify entity @s Fire set value 40
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.6, 0.44, 0.4], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 3}
