# AoE wave
particle sculk_soul ~ ~ ~ 0.35 0.35 0.35 .05 3
particle item{item:sculk} ~ ~ ~ .5 .5 .5 0.05 25
particle flash{color:-8454162} ~ ~ ~ 0 0 0 0 0
particle sculk_charge_pop ~ ~ ~ 0.5 0.5 0.5 0.1 10
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_shrieker.break", type: "player"}

# Mark
execute as @e[predicate=vexp:is_target,distance=..3.5] at @s run function vexp:dungeons/states/echo_scared
