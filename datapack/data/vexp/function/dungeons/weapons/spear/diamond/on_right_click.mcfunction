# dungeons/spear/diamond/on_right_click.mcfunction
# @s is the player

#Player Dash
function vexp:dungeons/weapons/spear/dash

#Subtle Buff
function vexp:dungeons/states/diamond_buffed
effect give @s blindness 1 0 true

execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/spear/diamond/wave

# Feedback
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.5, 0.7, 0.65], finalColor: [0.6, 0.9, 0.85], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 5}
particle instant_effect{color:9437155} ~ ~ ~ 0.5 0.5 0.5 0 1
particle flash{color:-7340061} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
