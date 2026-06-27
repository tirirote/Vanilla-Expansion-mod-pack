# dungeons/nether/projectile/on_tick.mcfunction
particle instant_effect{color:49358} ~ ~ ~ 0.2 0.2 0.2 0.2 5
particle enchanted_hit ~ ~ ~ 0.2 0.2 0.2 0.2 3
function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 1.7, dX: .1, dY: .1, dZ: .1, speed: 0.05, count: 1}

