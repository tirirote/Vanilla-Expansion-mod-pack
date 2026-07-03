# on_interact.mcfunction
# Se ejecuta AS la interaction del candelabro.

# Identificar al jugador que interactua
tag @a[tag=vexp.candle_holder_user] remove vexp.candle_holder_user
execute on target run tag @s add vexp.candle_holder_user

# Compatibilidad con estados legacy
execute unless data entity @s data.vexp.candle_variant run data modify entity @s data.vexp.candle_variant set value "none"
execute unless data entity @s data.vexp.candle_item run data modify entity @s data.vexp.candle_item set value ""
execute unless data entity @s data.vexp.candle_lit run data modify entity @s data.vexp.candle_lit set value 0

# Mano vacia: retirar vela si existe
execute unless data entity @a[tag=vexp.candle_holder_user,limit=1] SelectedItem if data entity @s data.vexp{candle_variant:"none"} run function vexp:custom_block/macro/sound {sound:"minecraft:block.lantern.hit"}
execute unless data entity @a[tag=vexp.candle_holder_user,limit=1] SelectedItem unless data entity @s data.vexp{candle_variant:"none"} run function vexp:custom_block/blocks/candle_holder/remove_candle

# Mano con vela: insertar si esta vacio
execute unless items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand #minecraft:candles if data entity @s data.vexp{candle_variant:"none"} run function vexp:custom_block/macro/sound {sound:"minecraft:block.stone.hit"}
execute unless items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand #minecraft:candles unless items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:flint_and_steel unless data entity @s data.vexp{candle_item:""} run function vexp:custom_block/macro/sound {sound:"minecraft:block.lantern.hit"}
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand #minecraft:candles if data entity @s data.vexp{candle_variant:"none"} run function vexp:custom_block/blocks/candle_holder/insert_candle

# Mano con mechero: encender si tiene vela apagada
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:flint_and_steel if data entity @s data.vexp{candle_lit:1} run function vexp:custom_block/macro/sound {sound:"minecraft:block.lantern.hit"}
execute if items entity @a[tag=vexp.candle_holder_user,limit=1] weapon.mainhand minecraft:flint_and_steel unless data entity @s data.vexp{candle_variant:"none"} if data entity @s data.vexp{candle_lit:0} run function vexp:custom_block/blocks/candle_holder/light_candle

# 4. Animacion de jitter
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

# Limpieza
tag @a[tag=vexp.candle_holder_user] remove vexp.candle_holder_user
