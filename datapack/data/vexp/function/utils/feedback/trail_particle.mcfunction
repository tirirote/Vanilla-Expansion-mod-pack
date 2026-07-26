# Trail particle follows given pos

summon marker ~ ~ ~ {Tags:["vexp.trail_marker"]}
$execute as @e[tag=vexp.trail_marker,sort=nearest,limit=1] run data modify entity @e[tag=vexp.trail_marker,sort=nearest,limit=1] data set value {particle:{col:$(col), duration:$(duration), pos:[], dX:$(dX), dY:$(dY), dZ:$(dZ), speed:$(speed), count:$(count)}}
execute as @e[tag=vexp.trail_marker,sort=nearest,limit=1] run data modify entity @e[tag=vexp.trail_marker,sort=nearest,limit=1] data.particle.pos set from entity @s Pos
function vexp:utils/feedback/trail_particle_macro with entity @e[tag=vexp.trail_marker,sort=nearest,limit=1] data.particle

kill @e[tag=vexp.trail_marker,sort=nearest,limit=1]
