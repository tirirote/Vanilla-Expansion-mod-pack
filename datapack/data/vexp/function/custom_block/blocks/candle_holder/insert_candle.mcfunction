# insert_candle.mcfunction
# Se ejecuta AS la interaction del candelabro.

# Guardar item de vela insertado
data modify entity @s data.vexp.candle_item set from entity @a[tag=vexp.candle_holder_user,limit=1] SelectedItem.id

# Resolver variante de vela para el modelo
data modify entity @s data.vexp.candle_variant set value "plain"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:white_candle run data modify entity @s data.vexp.candle_variant set value "white"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:orange_candle run data modify entity @s data.vexp.candle_variant set value "orange"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:magenta_candle run data modify entity @s data.vexp.candle_variant set value "magenta"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:light_blue_candle run data modify entity @s data.vexp.candle_variant set value "light_blue"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:yellow_candle run data modify entity @s data.vexp.candle_variant set value "yellow"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:lime_candle run data modify entity @s data.vexp.candle_variant set value "lime"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:pink_candle run data modify entity @s data.vexp.candle_variant set value "pink"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:gray_candle run data modify entity @s data.vexp.candle_variant set value "gray"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:light_gray_candle run data modify entity @s data.vexp.candle_variant set value "light_gray"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:cyan_candle run data modify entity @s data.vexp.candle_variant set value "cyan"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:purple_candle run data modify entity @s data.vexp.candle_variant set value "purple"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:blue_candle run data modify entity @s data.vexp.candle_variant set value "blue"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:brown_candle run data modify entity @s data.vexp.candle_variant set value "brown"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:green_candle run data modify entity @s data.vexp.candle_variant set value "green"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:red_candle run data modify entity @s data.vexp.candle_variant set value "red"
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:black_candle run data modify entity @s data.vexp.candle_variant set value "black"

# Al insertar siempre queda apagada
data modify entity @s data.vexp.candle_lit set value 0

# Consumir una vela de la mano del jugador
item modify entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}

# Aplicar modelo y feedback
function vexp:custom_block/blocks/candle_holder/update_display_model
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item_frame.add_item"}
