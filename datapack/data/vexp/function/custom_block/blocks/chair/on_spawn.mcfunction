# Etiquetar entidades recien creadas para compatibilidad con helpers de chair.
scoreboard players operation #temp vexp.id = #global vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run tag @s add vexp.chair
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #temp vexp.id run tag @s add vexp.chair_interact
