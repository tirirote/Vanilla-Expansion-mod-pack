# add_item.mcfunction
# Se ejecuta AS la interaction

# 1. Obtener ítem del jugador
data remove storage vexp:custom_block item_held
data modify storage vexp:custom_block item_held set from entity @p[tag=vexp.jar_user,limit=1] SelectedItem

# 2. Si no tiene ítem, no hacemos nada
execute unless data storage vexp:custom_block item_held run return fail

# 3. Solo aceptar dyes y polvos permitidos para el jar
execute unless items entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand #vexp:jar_ingredients run function vexp:custom_block/macro/sound {sound:"minecraft:block.glass.hit"}
execute unless items entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand #vexp:jar_ingredients run return fail

# 4. Validar límite (64 items)
# Inicializar contador si no existe
execute unless data entity @s data.vexp.item_count run data modify entity @s data.vexp.item_count set value 0

execute store result score #temp vexp.math run data get entity @s data.vexp.item_count
execute if score #temp vexp.math matches 64.. run return fail

# 5. Si el jar ya tiene contenido, el item debe ser del mismo tipo
execute if score #temp vexp.math matches 1.. if items entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand #vexp:jar_ingredients run function vexp:custom_block/macro/sound {sound:"minecraft:block.glass.hit"}
# El jar ya tiene contenido; solo aceptamos el mismo id exacto (Debe de estar en esta función, ya que sino, return fail no funciona)
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"white_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:white_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"orange_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:orange_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"magenta_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:magenta_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"light_blue_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:light_blue_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"yellow_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:yellow_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"lime_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:lime_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"pink_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:pink_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"gray_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:gray_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"light_gray_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:light_gray_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"cyan_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:cyan_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"purple_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:purple_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"blue_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:blue_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"brown_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:brown_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"green_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:green_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"red_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:red_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"black_dye"} unless data storage vexp:custom_block item_held{id:"minecraft:black_dye"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"redstone_dust"} unless data storage vexp:custom_block item_held{id:"minecraft:redstone"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"glowstone_dust"} unless data storage vexp:custom_block item_held{id:"minecraft:glowstone_dust"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"gunpowder"} unless data storage vexp:custom_block item_held{id:"minecraft:gunpowder"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"sugar"} unless data storage vexp:custom_block item_held{id:"minecraft:sugar"} run return fail
execute if score #temp vexp.math matches 1.. if data entity @s data.vexp{jar_content:"bone_meal"} unless data storage vexp:custom_block item_held{id:"minecraft:bone_meal"} run return fail

# 6. Añadir al jar el item permitido
execute unless score #temp vexp.math matches 64.. if items entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand #vexp:jar_ingredients run function vexp:custom_block/blocks/jar/perform_add
