# Pushback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 1.7, dX: 0.25, dY: 0.25, dZ: 0.25, speed: 0.05, count: 5}
particle instant_effect{color:16776562} ~ ~1 ~ 0.2 0.2 0.2 0.2 1
particle end_rod ~ ~1 ~ .2 .2 .2 0.1 1
