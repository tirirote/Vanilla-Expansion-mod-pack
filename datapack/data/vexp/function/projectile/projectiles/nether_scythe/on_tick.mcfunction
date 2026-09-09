# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-8637360, duration:7, dX:1, dY:0.1, dZ:1, count:5, speed:1}
particle flame ~ ~ ~ 0.5 0 0.5 0.01 1
particle dust_color_transition{from_color:3679786,to_color:8737350,scale:1.7} ~ ~ ~ 0.5 0 0.5 0 1
