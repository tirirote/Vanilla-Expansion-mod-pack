# Guardar tipo lógico para render + id real para drop

data modify entity @s data.vexp.jar_item_id set from storage vexp:custom_block item_held.id

execute if data storage vexp:custom_block item_held{id:"minecraft:white_dye"} run data modify entity @s data.vexp.jar_content set value "white_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:orange_dye"} run data modify entity @s data.vexp.jar_content set value "orange_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:magenta_dye"} run data modify entity @s data.vexp.jar_content set value "magenta_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:light_blue_dye"} run data modify entity @s data.vexp.jar_content set value "light_blue_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:yellow_dye"} run data modify entity @s data.vexp.jar_content set value "yellow_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:lime_dye"} run data modify entity @s data.vexp.jar_content set value "lime_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:pink_dye"} run data modify entity @s data.vexp.jar_content set value "pink_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:gray_dye"} run data modify entity @s data.vexp.jar_content set value "gray_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:light_gray_dye"} run data modify entity @s data.vexp.jar_content set value "light_gray_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:cyan_dye"} run data modify entity @s data.vexp.jar_content set value "cyan_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:purple_dye"} run data modify entity @s data.vexp.jar_content set value "purple_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:blue_dye"} run data modify entity @s data.vexp.jar_content set value "blue_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:brown_dye"} run data modify entity @s data.vexp.jar_content set value "brown_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:green_dye"} run data modify entity @s data.vexp.jar_content set value "green_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:red_dye"} run data modify entity @s data.vexp.jar_content set value "red_dye"
execute if data storage vexp:custom_block item_held{id:"minecraft:black_dye"} run data modify entity @s data.vexp.jar_content set value "black_dye"

execute if data storage vexp:custom_block item_held{id:"minecraft:redstone"} run data modify entity @s data.vexp.jar_content set value "redstone_dust"
execute if data storage vexp:custom_block item_held{id:"minecraft:glowstone_dust"} run data modify entity @s data.vexp.jar_content set value "glowstone_dust"
execute if data storage vexp:custom_block item_held{id:"minecraft:gunpowder"} run data modify entity @s data.vexp.jar_content set value "gunpowder"
execute if data storage vexp:custom_block item_held{id:"minecraft:sugar"} run data modify entity @s data.vexp.jar_content set value "sugar"
execute if data storage vexp:custom_block item_held{id:"minecraft:bone_meal"} run data modify entity @s data.vexp.jar_content set value "bone_meal"
