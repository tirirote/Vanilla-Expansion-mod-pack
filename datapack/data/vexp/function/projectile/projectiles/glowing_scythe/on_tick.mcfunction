# dungeons/glowing_scythe/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-6488120, duration:7, dX:1.0, dY:0.1, dZ:1.0, count:5, speed:1}
particle glow ~ ~ ~ 0.5 0.1 0.5 0 1
particle dust_color_transition{from_color:7798726,to_color:1261362,scale:0.8} ~ ~ ~ 0.5 0 0.5 1 3

# Break target blocks
execute positioned ~ ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
