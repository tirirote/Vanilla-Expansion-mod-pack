#Pushback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

#Visuals
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.8,0.8,0.8], finalColor: [0.9, 1.0, 1.0], scale: 1.7, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 5}
particle crit ~ ~1 ~ 0.2 0.2 0.2 0.5 10
