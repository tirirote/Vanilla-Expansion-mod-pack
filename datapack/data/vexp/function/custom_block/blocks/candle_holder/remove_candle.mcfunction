# remove_candle.mcfunction
# Se ejecuta AS la interaction del candelabro.

execute if data entity @s data.vexp.candle_item run summon item ~ ~0.6 ~ {Tags:["vexp.candle_holder_drop"],Item:{id:"minecraft:candle",count:1}}
execute if data entity @s data.vexp.candle_item as @e[type=item,tag=vexp.candle_holder_drop,sort=nearest,limit=1,distance=..1] run data modify entity @s Item.id set from entity @e[type=interaction,tag=vexp.custom_block.interact,sort=nearest,limit=1,distance=..1] data.vexp.candle_item
execute as @e[type=item,tag=vexp.candle_holder_drop,sort=nearest,limit=1,distance=..1] at @s run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}
tag @e[type=item,tag=vexp.candle_holder_drop,sort=nearest,limit=1,distance=..1] remove vexp.candle_holder_drop

# Limpiar bloque de luz
execute if block ~ ~ ~ light run setblock ~ ~ ~ air

# Resetear estado
data modify entity @s data.vexp.candle_variant set value "none"
data modify entity @s data.vexp.candle_item set value ""
data modify entity @s data.vexp.candle_lit set value 0

function vexp:custom_block/blocks/candle_holder/update_display_model
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item_frame.remove_item"}
