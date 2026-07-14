# add_item.mcfunction
# Se ejecuta AS la interaction de la bolsa

# 1. Obtener item del jugador
data remove storage vexp:custom_block bag_item_held
data modify storage vexp:custom_block bag_item_held set from entity @a[tag=vexp.bag_user,limit=1] SelectedItem
execute unless data storage vexp:custom_block bag_item_held run return fail

# 2. Validar item permitido
scoreboard players set #bag_allowed vexp.math 0
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:potato"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:beetroot"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:wheat"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:carrot"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:sweet_berries"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:glow_berries"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:apple"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:melon_slice"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:coal"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:raw_copper"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:raw_iron"} run scoreboard players set #bag_allowed vexp.math 1
execute if data storage vexp:custom_block bag_item_held{id:"minecraft:raw_gold"} run scoreboard players set #bag_allowed vexp.math 1

execute unless score #bag_allowed vexp.math matches 1 run function vexp:custom_block/macro/sound {sound:"minecraft:block.wool.hit"}
execute unless score #bag_allowed vexp.math matches 1 run return fail

# 3. Inicializar contador/limite
execute unless data entity @s data.vexp.item_count run data modify entity @s data.vexp.item_count set value 0
execute store result score #bag_count vexp.math run data get entity @s data.vexp.item_count

execute if score #bag_count vexp.math matches 64.. run function vexp:custom_block/macro/sound {sound:"minecraft:block.wool.hit"}
execute if score #bag_count vexp.math matches 64.. run return fail

# 4. Si no esta vacia, solo aceptar mismo id
execute if score #bag_count vexp.math matches 1.. unless data entity @s data.vexp.bag_item_id run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:potato"} if data entity @s data.vexp{bag_item_id:"minecraft:potato"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:beetroot"} if data entity @s data.vexp{bag_item_id:"minecraft:beetroot"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:wheat"} if data entity @s data.vexp{bag_item_id:"minecraft:wheat"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:carrot"} if data entity @s data.vexp{bag_item_id:"minecraft:carrot"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:sweet_berries"} if data entity @s data.vexp{bag_item_id:"minecraft:sweet_berries"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:glow_berries"} if data entity @s data.vexp{bag_item_id:"minecraft:glow_berries"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:apple"} if data entity @s data.vexp{bag_item_id:"minecraft:apple"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:melon_slice"} if data entity @s data.vexp{bag_item_id:"minecraft:melon_slice"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:coal"} if data entity @s data.vexp{bag_item_id:"minecraft:coal"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_copper"} if data entity @s data.vexp{bag_item_id:"minecraft:raw_copper"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_iron"} if data entity @s data.vexp{bag_item_id:"minecraft:raw_iron"} run return fail
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_gold"} if data entity @s data.vexp{bag_item_id:"minecraft:raw_gold"} run return fail

# Guardia final de mismatch cuando ya hay contenido
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:potato"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:beetroot"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:wheat"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:carrot"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:sweet_berries"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:glow_berries"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:apple"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:melon_slice"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:coal"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_copper"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_iron"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_gold"} run function vexp:custom_block/macro/sound {sound:"minecraft:block.wool.hit"}
execute if score #bag_count vexp.math matches 1.. unless data storage vexp:custom_block bag_item_held{id:"minecraft:potato"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:beetroot"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:wheat"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:carrot"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:sweet_berries"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:glow_berries"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:apple"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:melon_slice"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:coal"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_copper"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_iron"} unless data storage vexp:custom_block bag_item_held{id:"minecraft:raw_gold"} run return fail

# 5. Añadir item
function vexp:custom_block/blocks/bag/perform_add
