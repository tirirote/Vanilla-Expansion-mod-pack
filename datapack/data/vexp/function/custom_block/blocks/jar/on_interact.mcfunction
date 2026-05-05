# interact.mcfunction
# Se ejecuta AS la interaction del jarrón (vexp.custom_block.interact)

# 1. Identificar al jugador que interactúa
execute on target run tag @s add vexp.jar_user

# 2. Mano vacía: recoger todo el contenido del jar
execute store result score #temp vexp.math run data get entity @s data.vexp.item_count 1
execute if score #temp vexp.math matches 1.. if data entity @a[tag=vexp.jar_user,limit=1] {} unless data entity @a[tag=vexp.jar_user,limit=1] SelectedItem run function vexp:custom_block/blocks/jar/empty_all

# 3. Mano con item: intentar insertar
execute if data entity @a[tag=vexp.jar_user,limit=1] SelectedItem run function vexp:custom_block/blocks/jar/add_item

# Limpieza
tag @p[tag=vexp.jar_user,limit=1] remove vexp.jar_user
