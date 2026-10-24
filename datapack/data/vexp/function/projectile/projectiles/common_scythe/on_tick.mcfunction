# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-1780047, duration:7, dX:1, dY:0.1, dZ:1, count:5, speed:1}

# Break target blocks
function vexp:projectile/utils/scythe_block_break
