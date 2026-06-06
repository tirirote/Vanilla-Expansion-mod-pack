# dungeons/spear/on_right_click.mcfunction
#Player Dash
function vexp:dungeons/weapons/spear/dash

#Subtle Buff
effect give @s speed 3 0 true
effect give @s blindness 1 0 true

execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/spear/common_wave

# Feedback
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.8,0.8,0.8], finalColor: [0.9, 1.0, 1.0], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 5}
particle flash{color:-9145228} ~ ~ ~ 0.0 0.0 0.0 0 0
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
