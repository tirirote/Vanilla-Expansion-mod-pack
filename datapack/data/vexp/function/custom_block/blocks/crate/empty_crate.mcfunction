#1. Actualizamos el id y eliminamos los displays
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.crate.inventory,distance=..2] if score @s vexp.id = #temp vexp.id run kill @s

# 2. Actualizamos el storage con la data de la crate
data remove storage vexp:custom_block crate_break
data modify storage vexp:custom_block crate_break.items set from entity @s data.vexp.Items

# 3. Spawn the items
execute if data storage vexp:custom_block crate_break.items[0] at @s run function vexp:custom_block/blocks/crate/drop_items_loop

# 4. Cleanup de la data de la crate
data remove entity @s data.vexp.Items
data modify entity @s data.vexp.item_count set value 0
