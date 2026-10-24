# dungeons/echo_scythe/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-8454162, duration:7, dX:1.0, dY:0.1, dZ:1.0, count:5, speed:1}
particle sculk_charge_pop ~ ~ ~ 0.5 0.1 0.5 0.02 1
particle dust_color_transition{from_color:668982,to_color:6815730,scale:0.8} ~ ~ ~ 0.5 0 0.5 1 3

# Break target blocks
function vexp:projectile/utils/scythe_block_break
