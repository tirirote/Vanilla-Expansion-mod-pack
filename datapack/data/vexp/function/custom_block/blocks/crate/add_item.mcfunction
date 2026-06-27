# Se ejecuta AS la interaction de la crate

# Obtener item del jugador
data remove storage vexp:custom_block item_held
data modify storage vexp:custom_block item_held set from entity @a[tag=vexp.crate_user,limit=1] SelectedItem

# Si no hay item en mano, no hacer nada
execute unless data storage vexp:custom_block item_held run return fail

# Limite de 9 items visuales
execute unless data entity @s data.vexp.item_count run data modify entity @s data.vexp.item_count set value 0
execute store result score #temp vexp.id run data get entity @s data.vexp.item_count
execute if score #temp vexp.id matches 9.. run function vexp:custom_block/macro/sound {sound:"minecraft:block.bamboo_wood.hit"}

# Insertar
execute unless score #temp vexp.id matches 9.. run function vexp:custom_block/blocks/crate/perform_add
execute unless score #temp vexp.id matches 9.. run function vexp:custom_block/macro/sound {sound:"minecraft:entity.item_frame.place"}
