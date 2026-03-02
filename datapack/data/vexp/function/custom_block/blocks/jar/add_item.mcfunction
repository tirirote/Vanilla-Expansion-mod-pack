# add_item.mcfunction
# Se ejecuta AS la interaction

# 1. Obtener ítem del jugador
data remove storage vexp:custom_block item_held
data modify storage vexp:custom_block item_held set from entity @p[tag=vexp.jar_user,limit=1] SelectedItem

# 2. Si no tiene ítem, no hacemos nada
execute unless data storage vexp:custom_block item_held run return fail

# 3. Validar límite (64 items)
# Inicializar contador si no existe
execute unless data entity @s data.vexp.item_count run data modify entity @s data.vexp.item_count set value 0
execute store result score #temp vexp.id run data get entity @s data.vexp.item_count
execute if score #temp vexp.id matches 64.. run return fail

# 4. Ejecutar inserción
function vexp:custom_block/blocks/jar/perform_add