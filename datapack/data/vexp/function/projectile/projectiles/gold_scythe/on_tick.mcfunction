# dungeons/nether/projectile/on_tick.mcfunction
particle instant_effect{color:16763707} ~ ~ ~ 0.2 0.2 0.2 0.2 5
particle crit ~ ~ ~ .2 .2 .2 0.2 5
function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.8, 0.2], finalColor: [0.85, 0.75, 0.3], scale: 1.7, dX: .1, dY: .1, dZ: .1, speed: 1, count: 1}
