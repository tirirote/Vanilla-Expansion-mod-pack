# Mark mob
function vexp:dungeons/states/echo_marked
# Pushback
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

# Visuals
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: .5, dY: .5, dZ: .5, speed: 0.05, count: 5}
particle sculk_charge_pop ~ ~1 ~ 0.25 0.25 0.25 0.1 3
particle glow ~ ~1 ~ 0.2 0.2 0.2 0.1 3
