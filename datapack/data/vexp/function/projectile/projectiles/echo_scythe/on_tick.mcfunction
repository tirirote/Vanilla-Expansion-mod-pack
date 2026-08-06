# dungeons/echo_scythe/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-8454162, duration:7, dX:1.0, dY:0.1, dZ:1.0, count:5, speed:1}
particle sculk_charge_pop ~ ~ ~ 0.5 0.1 0.5 0.02 1
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 0.8, dX: 0.5, dY: 0, dZ: 0.5, speed: 1, count: 3}
