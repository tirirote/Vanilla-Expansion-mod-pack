# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-8637360, duration:7, dX:1, dY:0.1, dZ:1, count:5, speed:1}
particle flame ~ ~ ~ .5 .1 .5 0.01 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.5, dY: 0, dZ: 0.5, speed: 1, count: 3}
