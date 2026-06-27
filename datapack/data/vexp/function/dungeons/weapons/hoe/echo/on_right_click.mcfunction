# dungeons/hoe/on_right_click.mcfunction
# Hoe Right Click

function vexp:dungeons/weapons/hoe/auto_crop_replant

execute positioned ^ ^ ^1.5 run particle sweep_attack ~ ~ ~ 1 1 1 1 0
execute positioned ^ ^ ^1.5 run particle sculk_charge_pop ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^2 run particle sculk_charge_pop ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^3 run particle sculk_charge_pop ~ ~ ~ 0.1 0.1 0.1 0.3 5

execute positioned ^ ^ ^1.5 run particle item{item:sculk} ~ ~ ~ 0.1 0.1 0.1 0.3 3
execute positioned ^ ^ ^2 run particle item{item:sculk} ~ ~ ~ 0.1 0.1 0.1 0.3 3
execute positioned ^ ^ ^3 run particle item{item:sculk} ~ ~ ~ 0.1 0.1 0.1 0.3 3

#Buff
function vexp:dungeons/states/echo_buffed

particle flash{color:-8454162} ~ ~ ~ 0 0 0 0 0
particle sculk_soul ~ ~ ~ 0.2 0.2 0.2 0.1 1
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
