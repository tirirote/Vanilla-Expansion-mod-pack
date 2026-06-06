# dungeons/spear/echo/on_right_click.mcfunction
# @s is the player

#Player Dash
function vexp:dungeons/weapons/spear/dash

#Subtle Buff
function vexp:dungeons/states/echo_buffed
effect give @s blindness 1 0 true

execute positioned ^ ^ ^3.5 as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/spear/echo/wave

# Feedback
execute positioned ~ ~ ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.0, 0.0, 0.0], finalColor: [0.4, 0.7, 0.7], scale: 1.7, dX: 0.2, dY: 0.5, dZ: 0.2, speed: 0.05, count: 5}
particle sculk_charge_pop ~ ~-.5 ~ 0.2 0.5 0.2 0.05 5
particle flash{color:-8454162} ~ ~ ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}

