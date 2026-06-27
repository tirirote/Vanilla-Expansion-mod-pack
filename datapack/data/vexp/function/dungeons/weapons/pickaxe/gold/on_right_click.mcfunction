# dungeons/pickaxe/gold/on_right_click.mcfunction
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

execute positioned ^ ^ ^1.5 run particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0.3 3
execute positioned ^ ^ ^2 run particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0.3 3
execute positioned ^ ^ ^3 run particle instant_effect{color:16776562} ~ ~ ~ 0.1 0.1 0.1 0.3 3

#Buff
function vexp:dungeons/states/gold_buffed

particle flash{color:-655515} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
