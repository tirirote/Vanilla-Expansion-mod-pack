# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-8454162, duration:7, dX:0.002, dY:0.002, dZ:0.002, count:1, speed:1}
particle sculk_charge_pop ~ ~ ~ 0.02 0.02 0.02 0.02 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 0.8, dX: 0, dY: 0, dZ: 0, speed: 1, count: 1}
