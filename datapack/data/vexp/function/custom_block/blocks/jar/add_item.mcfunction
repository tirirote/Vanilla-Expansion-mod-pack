# add_item.mcfunction
# Se ejecuta AS la interaction

# 1. Obtener ítem del jugador
data remove storage vexp:custom_block item_held
data modify storage vexp:custom_block item_held set from entity @p[tag=vexp.jar_user,limit=1] SelectedItem

# 2. Si no tiene ítem, no hacemos nada
execute unless data storage vexp:custom_block item_held run return fail

# 3. Solo aceptar dyes y polvos permitidos para el jar
execute unless items entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand #vexp:jar_ingredients run return fail

# 4. Validar límite (64 items)
# Inicializar contador si no existe
execute unless data entity @s data.vexp.item_count run data modify entity @s data.vexp.item_count set value 0
execute store result score #temp vexp.math run data get entity @s data.vexp.item_count
execute if score #temp vexp.math matches 64.. run return fail

# Compat: si hay conteo pero no tipo persistido, bloqueamos inserción para evitar mezclar datos legacy
execute if score #temp vexp.math matches 1.. unless data entity @s data.vexp.jar_content run return fail

# 5. Si el jar ya tiene contenido, el item debe ser del mismo tipo
execute if score #temp vexp.math matches 1.. run function vexp:custom_block/blocks/jar/validate_same_type

# 6. Ejecutar inserción
function vexp:custom_block/blocks/jar/perform_add
