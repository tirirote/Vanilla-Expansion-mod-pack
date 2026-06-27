# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player
# Attempt to catch a mob if none are currently caught

execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched

execute as @e[predicate=vexp:is_target,distance=..6,limit=1,sort=nearest,tag=vexp.state.catched] run function vexp:dungeons/states/echo_marked

#Buff
function vexp:dungeons/states/echo_buffed

#Feedback
particle sculk_soul ~ ~ ~ 0.2 0.2 0.2 0.1 3
function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: .5, dY: .5, dZ: .5, speed: 0.05, count: 5}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
