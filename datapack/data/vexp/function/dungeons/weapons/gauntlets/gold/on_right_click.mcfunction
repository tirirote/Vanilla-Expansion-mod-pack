# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player
# Attempt to catch a mob if none are currently caught

execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,tag=!vexp.state.catched,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched

#Buff
function vexp:dungeons/states/gold_buffed

#Feedback
particle instant_effect{color:16776562} ~ ~ ~ 0.5 0.5 0.5 0 1
particle instant_effect{color:16763707} ~ ~ ~ 0.5 0.5 0.5 0 2
particle crit ~ ~ ~ .25 .25 .25 .5 3
function vexp:utils/feedback/dust_particle {initialColor: [0.75, 0.7, 0.4], finalColor: [0.9, 0.9, 0.75], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 5}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
