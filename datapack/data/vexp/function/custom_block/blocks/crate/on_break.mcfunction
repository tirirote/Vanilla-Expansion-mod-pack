# Se ejecuta AS la interaction de la crate

# Limpiar item_displays visuales
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.crate.inventory,distance=..2] if score @s vexp.id = #temp vexp.id run kill @s

# Droppear items desde el NBT de la crate
data remove storage vexp:custom_block crate_break
data modify storage vexp:custom_block crate_break.items set from entity @s data.vexp.Items
execute if data storage vexp:custom_block crate_break.items[0] at @s run function vexp:custom_block/blocks/crate/drop_items_loop
