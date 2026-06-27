# dungeons/pickaxe/on_right_click.mcfunction
# Pickaxe Right Click
execute positioned ^ ^ ^6 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^5 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^4 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^3 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^2 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine
execute positioned ^ ^ ^1 if block ~ ~ ~ #mineable/pickaxe if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/pickaxe/vein_mine

execute positioned ^ ^ ^1.5 run particle sweep_attack ~ ~ ~ 1 1 1 1 0
execute positioned ^ ^ ^1.5 run particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^2 run particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.3 5
execute positioned ^ ^ ^3 run particle enchanted_hit ~ ~ ~ 0.1 0.1 0.1 0.3 5

execute positioned ^ ^ ^1.5 run particle instant_effect{color:9437155} ~ ~ ~ 0.1 0.1 0.1 0.3 1
execute positioned ^ ^ ^2 run particle instant_effect{color:9437155} ~ ~ ~ 0.1 0.1 0.1 0.3 1
execute positioned ^ ^ ^3 run particle instant_effect{color:9437155} ~ ~ ~ 0.1 0.1 0.1 0.3 1

#Buff
function vexp:dungeons/states/diamond_buffed


particle flash{color:-7340061} ~ ~ ~ 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.amethyst_block.hit", type: "player"}
