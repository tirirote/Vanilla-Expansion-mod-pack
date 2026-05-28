# Mark mob
function vexp:dungeons/states/nether_marked
# Pushback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

#Visuals
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0.5, dY: 0.5, dZ: 0.5, speed: 0.05, count: 5}
particle flame ~ ~1 ~ .2 .2 .2 0.1 3
