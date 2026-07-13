# Guardar id real para drop y tipo logico para modelo

data modify entity @s data.vexp.bag_item_id set from storage vexp:custom_block bag_item_held.id
data modify entity @s data.vexp.bag_content set value "generic"

# Mapeo de contenido para variantes visuales
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:potato"} run data modify entity @s data.vexp.bag_content set value "potatoes"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:beetroot"} run data modify entity @s data.vexp.bag_content set value "beetroots"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:wheat"} run data modify entity @s data.vexp.bag_content set value "wheat"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:carrot"} run data modify entity @s data.vexp.bag_content set value "carrots"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:sweet_berries"} run data modify entity @s data.vexp.bag_content set value "sweet_berries"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:glow_berries"} run data modify entity @s data.vexp.bag_content set value "glow_berries"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:apple"} run data modify entity @s data.vexp.bag_content set value "apples"
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:melon_slice"} run data modify entity @s data.vexp.bag_content set value "melons"
