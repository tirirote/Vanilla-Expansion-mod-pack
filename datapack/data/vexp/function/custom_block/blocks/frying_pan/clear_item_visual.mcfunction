# Se ejecuta AS la interaction de la sarten
# Elimina el item_display interno vinculado por ID
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.frying_pan.item,distance=..2] if score @s vexp.id = #temp vexp.id run kill @s
