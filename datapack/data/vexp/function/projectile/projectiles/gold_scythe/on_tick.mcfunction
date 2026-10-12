# dungeons/nether/projectile/on_tick.mcfunction
function vexp:utils/feedback/trail_particle {col:-655515, duration:7, dX:1, dY:0.1, dZ:1, count:5, speed:0}
particle instant_effect{color:16763707} ~ ~ ~ 0.5 0.1 0.5 0.2 1

# Break target blocks
execute positioned ~ ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~ ~ ~-1 if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~1 ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
execute positioned ~-1 ~ ~ if block ~ ~ ~ #vexp:scythe_targets run setblock ~ ~ ~ air destroy
