# light_candle.mcfunction
# Se ejecuta AS la interaction del candelabro.

# Encender vela
data modify entity @s data.vexp.candle_lit set value 1
function vexp:custom_block/blocks/candle_holder/update_display_model

# Iluminación con bloque de luz
execute if block ~ ~ ~ #replaceable run setblock ~ ~ ~ light[level=4]

# Aplicar desgaste del mechero al jugador que interactua
execute as @a[tag=vexp.candle_holder_user,limit=1] run function vexp:custom_block/blocks/candle_holder/damage_lighter

# Feedback
function vexp:custom_block/macro/sound {sound:"minecraft:item.flintandsteel.use"}
