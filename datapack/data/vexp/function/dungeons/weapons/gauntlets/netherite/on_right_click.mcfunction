# dungeons/gauntlets/on_right_click.mcfunction
# @s is the player
# Attempt to catch a mob if none are currently caught

execute positioned ^ ^ ^2.5 as @e[predicate=vexp:is_target,distance=..3.5,limit=1,sort=nearest] at @s run function vexp:dungeons/states/catched

execute as @e[predicate=vexp:is_target,distance=..6,limit=1,sort=nearest,tag=vexp.state.catched] run function vexp:dungeons/states/nether_marked

#Buff
function vexp:dungeons/states/nether_buffed

#Feedback
#Netherite weapons hit particles
particle trial_spawner_detection ~ ~ ~ 0.25 0.25 0.25 .05 5
particle lava ~ ~ ~ .2 .2 .2 0 1
function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 0.8, dX: 0.35, dY: 0.35, dZ: 0.35, speed: 1, count: 5}

function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
