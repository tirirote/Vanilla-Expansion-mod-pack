# On special attack feedback hook
# @s is the custom mob
particle item_cobweb ^ ^ ^1 0.1 0.1 0.1 0.25 5
particle item_cobweb ^ ^ ^1.5 0.1 0.1 0.1 0.1 3
particle item_cobweb ^ ^ ^2 0.1 0.1 0.1 0.1 3
particle item_cobweb ^ ^ ^2.5 0.1 0.1 0.1 0.1 3
particle item_cobweb ^ ^ ^3 0.1 0.1 0.1 0.1 3
particle item_cobweb ^ ^ ^3.5 0.1 0.1 0.1 0.1 2
particle item_cobweb ^ ^ ^4.5 0.1 0.1 0.1 0.1 2
particle item_cobweb ^ ^ ^5 0.1 0.1 0.1 0.1 1

execute positioned ^ ^ ^3 if block ~ ~ ~ #replaceable if entity @p[distance=..1.25] run setblock ~ ~ ~ cobweb
execute positioned ^ ^ ^4 if block ~ ~ ~ #replaceable if entity @p[distance=..1.25] run setblock ~ ~ ~ cobweb
execute positioned ^ ^ ^5 if block ~ ~ ~ #replaceable if entity @p[distance=..1.25] run setblock ~ ~ ~ cobweb

function vexp:utils/sound {sound: "minecraft:entity.shulker.shoot", type: "player"}
