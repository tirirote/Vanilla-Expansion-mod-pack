# Elimina el item_display interno vinculado por ID

scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.cutting_board.item,distance=..2] if score @s vexp.id = #temp vexp.id run kill @s
