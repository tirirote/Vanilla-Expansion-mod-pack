# dungeons/hoe/glowing/on_right_click.mcfunction
# Hoe Right Click

function vexp:dungeons/weapons/hoe/auto_crop_replant

execute positioned ^ ^ ^1.5 run particle sweep_attack ~ ~ ~ 1 1 1 1 0
execute positioned ^ ^ ^1.5 run particle squid_ink ~ ~ ~ 0.1 0.1 0.1 0.3 1
execute positioned ^ ^ ^2 run particle squid_ink ~ ~ ~ 0.1 0.1 0.1 0.3 1
execute positioned ^ ^ ^3 run particle squid_ink ~ ~ ~ 0.1 0.1 0.1 0.3 1

execute positioned ^ ^ ^1.5 run particle glow ~ ~ ~ 0.1 0.1 0.1 0.3 1
execute positioned ^ ^ ^2 run particle glow ~ ~ ~ 0.1 0.1 0.1 0.3 1
execute positioned ^ ^ ^3 run particle glow ~ ~ ~ 0.1 0.1 0.1 0.3 1

#Buff
function vexp:dungeons/states/glow_buffed

particle flash{color:-6488120} ~ ~ ~ 0 0 0 0 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player"}
