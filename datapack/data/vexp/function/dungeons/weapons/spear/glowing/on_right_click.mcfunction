# dungeons/spear/glowing/on_right_click.mcfunction
# @s is the player

#Player Dash
function vexp:dungeons/weapons/spear/dash

#Subtle Buff
function vexp:dungeons/states/glow_buffed
effect give @s blindness 1 0 true

execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/spear/glowing/wave

# Feedback
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.1, 0.1], finalColor: [0.4, 0.8, 0.65], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 5}
particle glow ~ ~ ~ 0.5 0.5 0.5 1 3
particle flash{color:-6488120} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.hurt", type: "player"}
