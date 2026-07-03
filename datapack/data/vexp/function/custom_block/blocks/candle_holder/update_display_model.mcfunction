# update_display_model.mcfunction
# Actualiza el modelo visual del candelabro segun variante de vela y estado encendido.

execute unless data entity @s data.vexp.candle_variant run data modify entity @s data.vexp.candle_variant set value "none"
execute unless data entity @s data.vexp.candle_lit run data modify entity @s data.vexp.candle_lit set value 0

scoreboard players operation #candle_holder_id vexp.id = @s vexp.id

# Sin vela -> modelo base
execute if data entity @s data.vexp{candle_variant:"none"} run data modify entity @s data.vexp.model set value "vexp:candle_holder"
execute if data entity @s data.vexp{candle_variant:"none"} as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #candle_holder_id vexp.id run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:candle_holder"]

# Con vela -> modelo por color + estado (lit/apagado)
execute unless data entity @s data.vexp{candle_variant:"none"} run data remove storage vexp:custom_block candle_holder_model
execute unless data entity @s data.vexp{candle_variant:"none"} run data modify storage vexp:custom_block candle_holder_model.variant set from entity @s data.vexp.candle_variant
execute unless data entity @s data.vexp{candle_variant:"none"} run data modify storage vexp:custom_block candle_holder_model.lit set from entity @s data.vexp.candle_lit
execute unless data entity @s data.vexp{candle_variant:"none"} run function vexp:custom_block/blocks/candle_holder/update_display_model_macro with storage vexp:custom_block candle_holder_model
