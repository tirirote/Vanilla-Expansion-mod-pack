#effect give @s minecraft:strength 2 0 true
#execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.5,0.35,0.35], finalColor: [0.8, 0.55, 0.75], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.1, count: 5}
#function vexp:utils/sound {sound:"minecraft:block.beacon.power_select", type:"player"}
