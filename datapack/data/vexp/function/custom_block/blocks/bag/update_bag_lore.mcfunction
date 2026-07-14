# Modify bag Lore (Shulker like display)

# Update Lore
execute if data entity @s data.vexp{bag_item_id:"minecraft:potato"} run data modify storage vexp:custom_block bag_drop.name set value "Patata"
execute if data entity @s data.vexp{bag_item_id:"minecraft:beetroot"} run data modify storage vexp:custom_block bag_drop.name set value "Remolacha"
execute if data entity @s data.vexp{bag_item_id:"minecraft:wheat"} run data modify storage vexp:custom_block bag_drop.name set value "Trigo"
execute if data entity @s data.vexp{bag_item_id:"minecraft:carrot"} run data modify storage vexp:custom_block bag_drop.name set value "Zanahoria"
execute if data entity @s data.vexp{bag_item_id:"minecraft:sweet_berries"} run data modify storage vexp:custom_block bag_drop.name set value "Bayas dulces"
execute if data entity @s data.vexp{bag_item_id:"minecraft:glow_berries"} run data modify storage vexp:custom_block bag_drop.name set value "Bayas luminosas"
execute if data entity @s data.vexp{bag_item_id:"minecraft:apple"} run data modify storage vexp:custom_block bag_drop.name set value "Manzana"
execute if data entity @s data.vexp{bag_item_id:"minecraft:melon_slice"} run data modify storage vexp:custom_block bag_drop.name set value "Rodaja de sandía"
execute if data entity @s data.vexp{bag_item_id:"minecraft:coal"} run data modify storage vexp:custom_block bag_drop.name set value "Carbón"
execute if data entity @s data.vexp{bag_item_id:"minecraft:raw_copper"} run data modify storage vexp:custom_block bag_drop.name set value "Cobre en bruto"
execute if data entity @s data.vexp{bag_item_id:"minecraft:raw_iron"} run data modify storage vexp:custom_block bag_drop.name set value "Hierro en bruto"
execute if data entity @s data.vexp{bag_item_id:"minecraft:raw_gold"} run data modify storage vexp:custom_block bag_drop.name set value "Oro en bruto"

data modify storage vexp:custom_block bag_drop.item_count set from entity @s data.vexp.item_count

function vexp:custom_block/blocks/bag/update_bag_lore_macro with storage vexp:custom_block bag_drop
