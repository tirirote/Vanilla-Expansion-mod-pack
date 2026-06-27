# dungeons/hoe/gold/on_right_click.mcfunction
# Hoe Right Click

function vexp:dungeons/weapons/hoe/auto_crop_replant

execute positioned ^ ^ ^1.5 run particle sweep_attack ~ ~ ~ 1 1 1 1 0
execute positioned ^ ^ ^1.5 run particle crit ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^2 run particle crit ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^3 run particle crit ~ ~ ~ 0.1 0.1 0.1 0.3 5

execute positioned ^ ^ ^1.5 run particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0.3 3
execute positioned ^ ^ ^2 run particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0.3 3
execute positioned ^ ^ ^3 run particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0.3 3

#Buff
function vexp:dungeons/states/gold_buffed

particle flash{color:-655515} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
