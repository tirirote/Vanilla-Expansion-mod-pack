# Se ejecuta AS la interaction de la sarten
# Marca #can_cook=1 solo para items validos en la sarten

scoreboard players set #can_cook vexp.math 0

# Cooking custom
execute if data entity @s data.vexp.pan_item{id:"minecraft:wheat_seeds"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:melon_seeds"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:pumpkin_seeds"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:beetroot_seeds"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:sweet_berries"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:glow_berries"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:beetroot"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:brown_mushroom"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:red_mushroom"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:bread"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"beef_strip"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_strip"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_breast"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_drumstick"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"porkchop_strip"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"cod_strip"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"salmon_strip"}}}} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{components:{"minecraft:custom_data":{vexp:{type:"food",id:"pufferfish_strip"}}}} run scoreboard players set #can_cook vexp.math 1

# Cocina vanilla
execute if data entity @s data.vexp.pan_item{id:"minecraft:chicken"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:beef"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:porkchop"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:mutton"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:potato"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:cod"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:salmon"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:rabbit"} run scoreboard players set #can_cook vexp.math 1
execute if data entity @s data.vexp.pan_item{id:"minecraft:kelp"} run scoreboard players set #can_cook vexp.math 1
