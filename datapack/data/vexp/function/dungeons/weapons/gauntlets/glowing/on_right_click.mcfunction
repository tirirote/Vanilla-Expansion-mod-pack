# dungeons/gauntlets/glowing/on_right_click.mcfunction
# @s is the player

execute positioned ^ ^ ^5 as @e[predicate=vexp:is_target,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched
execute as @e[predicate=vexp:is_target,distance=..6,limit=1,sort=nearest,tag=vexp.state.catched] run function vexp:dungeons/states/glow_marked

#Buff
function vexp:dungeons/states/glow_buffed

#Feedback
particle glow ~ ~ ~ 0.2 0.2 0.2 0.1 3
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.2, 0.3], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: .5, dY: .5, dZ: .5, speed: 0.05, count: 5}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
