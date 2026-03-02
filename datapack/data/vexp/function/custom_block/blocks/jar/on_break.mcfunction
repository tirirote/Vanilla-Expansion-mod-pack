# on_break.mcfunction
# Se ejecuta AS la interaction del jarrón

# 1. Guardar ID del jarrón para identificar sus items
scoreboard players operation #temp vexp.id = @s vexp.id

# 2. Hacer que cada visual suelte su item
# Buscamos todos los displays que tengan el mismo ID que este jarrón
execute as @e[type=item_display,tag=vexp.jar.inventory,sort=nearest,distance=..1] if score @s vexp.id = #temp vexp.id at @s run function vexp:custom_block/blocks/jar/drop_item_logic