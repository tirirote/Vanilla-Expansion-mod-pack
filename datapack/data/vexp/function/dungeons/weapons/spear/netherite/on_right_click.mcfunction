# dungeons/spear/netherite/on_right_click.mcfunction
# @s is the player

#Player Dash
function vexp:dungeons/weapons/spear/dash

#Subtle Buff
function vexp:dungeons/states/nether_buffed
effect give @s blindness 1 0 true

execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/spear/netherite/wave

# Feedback
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.55, 0.4, 0.5], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 5}
particle flame ~ ~-.5 ~ 0.2 0.5 0.2 0.05 5
particle flash{color:-26073} ~ ~ ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}

