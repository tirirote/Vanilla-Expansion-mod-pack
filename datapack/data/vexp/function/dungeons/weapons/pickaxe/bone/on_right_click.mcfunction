# dungeons/pickaxe/on_right_click.mcfunction
# Pickaxe Right Click
execute positioned ^ ^ ^6 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^5 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^4 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^3 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^2 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^1 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine

execute positioned ^ ^ ^1.5 run particle sweep_attack ~ ~ ~ 1 1 1 1 0
execute positioned ^ ^ ^1.5 run particle crit ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^2 run particle crit ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^3 run particle crit ~ ~ ~ 0.1 0.1 0.1 0.3 5

function vexp:dungeons/fx/right_click/common
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player", pitch:1}
