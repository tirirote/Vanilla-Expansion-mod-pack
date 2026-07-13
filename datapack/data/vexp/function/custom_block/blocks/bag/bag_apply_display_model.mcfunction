# Actualizar modelo del item_display segun estado abierto/cerrado + contenido + llenado

scoreboard players operation #bag_id vexp.id = @s vexp.id

# Abierta vacia -> modelo abierto base
execute if entity @s[tag=vexp.bag_opened] unless data entity @s data.vexp.bag_fill_state run data modify entity @s data.vexp.model set value "vexp:bag_opened"
execute if entity @s[tag=vexp.bag_opened] unless data entity @s data.vexp.bag_fill_state as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #bag_id vexp.id run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:bag_opened"]

# Cerrada o vacia cerrada -> modelo base
execute unless entity @s[tag=vexp.bag_opened] run data modify entity @s data.vexp.model set value "vexp:bag"
execute unless entity @s[tag=vexp.bag_opened] as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #bag_id vexp.id run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:bag"]

# Abierta con contenido -> resolver macro
execute if entity @s[tag=vexp.bag_opened] if data entity @s data.vexp.bag_fill_state run data remove storage vexp:custom_block bag_model
execute if entity @s[tag=vexp.bag_opened] if data entity @s data.vexp.bag_fill_state run data modify storage vexp:custom_block bag_model.state set from entity @s data.vexp.bag_fill_state
execute if entity @s[tag=vexp.bag_opened] if data entity @s data.vexp.bag_fill_state run data modify storage vexp:custom_block bag_model.content set from entity @s data.vexp.bag_content
execute if entity @s[tag=vexp.bag_opened] if data entity @s data.vexp.bag_fill_state run function vexp:custom_block/blocks/bag/bag_apply_display_model_macro with storage vexp:custom_block bag_model
