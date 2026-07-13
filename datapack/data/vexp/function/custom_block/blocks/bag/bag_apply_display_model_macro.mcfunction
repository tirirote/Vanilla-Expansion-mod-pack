# Modelos base abiertos por estado
execute if data storage vexp:custom_block bag_model{state:"almost_empty"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_almost_empty"
execute if data storage vexp:custom_block bag_model{state:"half_full"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_half_full"
execute if data storage vexp:custom_block bag_model{state:"almost_full"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_almost_full"
execute if data storage vexp:custom_block bag_model{state:"full"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_full"

# Variante por contenido (usa el token bag_model.content)
$execute if data storage vexp:custom_block bag_model{state:"almost_empty"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_almost_empty_$(content)"
$execute if data storage vexp:custom_block bag_model{state:"half_full"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_half_full_$(content)"
$execute if data storage vexp:custom_block bag_model{state:"almost_full"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_almost_full_$(content)"
$execute if data storage vexp:custom_block bag_model{state:"full"} run data modify entity @s data.vexp.model set value "vexp:bag_opened_full_$(content)"

$execute as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #bag_id vexp.id if data storage vexp:custom_block bag_model{state:"almost_empty"} run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:bag_opened_almost_empty_$(content)"]
$execute as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #bag_id vexp.id if data storage vexp:custom_block bag_model{state:"half_full"} run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:bag_opened_half_full_$(content)"]
$execute as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #bag_id vexp.id if data storage vexp:custom_block bag_model{state:"almost_full"} run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:bag_opened_almost_full_$(content)"]
$execute as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #bag_id vexp.id if data storage vexp:custom_block bag_model{state:"full"} run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:bag_opened_full_$(content)"]
