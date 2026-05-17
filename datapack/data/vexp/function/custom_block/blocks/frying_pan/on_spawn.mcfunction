# Inicializa estado de coccion al colocar una sarten nueva
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.cook_time set value 0
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run scoreboard players set @s vexp.cook_time 0
