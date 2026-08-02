# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-8637360, duration:7, dX:0.002, dY:0.002, dZ:0.002, count:1, speed:1}
particle flame ~ ~ ~ 0.02 0.02 0.02 0.02 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 1, count: 1}

