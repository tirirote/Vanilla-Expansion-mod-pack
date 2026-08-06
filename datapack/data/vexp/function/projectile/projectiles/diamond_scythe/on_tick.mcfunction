# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-49358, duration:7, dX:1, dY:0.1, dZ:1, count:5, speed:1}
particle instant_effect{color:49358} ~ ~ ~ 0.5 0.2 0.5 0.2 1
