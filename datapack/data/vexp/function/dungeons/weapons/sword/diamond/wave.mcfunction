# Pushback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 1.7, dX: 0.25, dY: 0.25, dZ: 0.25, speed: 0.05, count: 5}
particle enchanted_hit ~ ~1 ~ 0.2 0.2 0.2 0.5 10
particle instant_effect{color:9437155} ~ ~1 ~ 0.2 0.2 0.2 .2 1
