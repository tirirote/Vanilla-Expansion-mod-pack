# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player
# Attempt to catch a mob if none are currently caught

execute positioned ^ ^ ^5 as @e[predicate=vexp:is_target,tag=!vexp.state.catched,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched

#Feedback
particle instant_effect{color:9437155} ~ ~ ~ 0.5 0.5 0.5 0 1
particle instant_effect{color:49358} ~ ~ ~ 0.5 0.5 0.5 0 2
particle enchanted_hit ~ ~ ~ .25 .25 .25 .5 3
function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 0.05, count: 5}
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
