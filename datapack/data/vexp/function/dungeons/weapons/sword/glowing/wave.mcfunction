function vexp:dungeons/states/glow_marked
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.0}

#Visuals
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 2.8, dX: .35, dY: .35, dZ: .35, speed: 1, count: 3}

particle glow ~ ~ ~ 0.2 0.2 0.2 0.02 3
particle glow_squid_ink ~ ~ ~ .5 .5 .5 0.1 3
particle squid_ink ~ ~ ~ .5 .5 .5 0.1 5
