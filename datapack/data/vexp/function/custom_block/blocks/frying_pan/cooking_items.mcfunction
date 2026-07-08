# Frying pan cooked results

# Wheat Seeds
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:wheat_seeds"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:wheat_seeds"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"roasted_wheat_seeds"}},"minecraft:custom_model_data":{strings:["vexp:roasted_wheat_seeds"]},"minecraft:item_name":{text:"Semillas de trigo tostadas",italic:false},food:{nutrition:2,saturation:0.2f}}}

# Melon Seeds
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:melon_seeds"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:melon_seeds"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"roasted_melon_seeds"}},"minecraft:custom_model_data":{strings:["vexp:roasted_melon_seeds"]},"minecraft:item_name":{text:"Semillas de melón tostadas",italic:false},food:{nutrition:2,saturation:0.2f}}}

# Pumpkin Seeds
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:pumpkin_seeds"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:pumpkin_seeds"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"roasted_pumpkin_seeds"}},"minecraft:custom_model_data":{strings:["vexp:roasted_pumpkin_seeds"]},"minecraft:item_name":{text:"Semillas de calabaza tostadas",italic:false},food:{nutrition:2,saturation:0.2f}}}

# Beetroot Seeds
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:beetroot_seeds"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:beetroot_seeds"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"rosted_beetroot_seeds"}},"minecraft:custom_model_data":{strings:["vexp:rosted_beetroot_seeds"]},"minecraft:item_name":{text:"Semillas de remolacha tostadas",italic:false},food:{nutrition:2,saturation:0.2f}}}

# Sweet Berries
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:sweet_berries"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:sweet_berries"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"dried_sweet_berries"}},"minecraft:custom_model_data":{strings:["vexp:dried_sweet_berries"]},"minecraft:item_name":{text:"Bayas dulces secas",italic:false},food:{nutrition:3,saturation:0.3f}}}

# Glow berries
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:glow_berries"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:glow_berries"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"dried_glow_berries"}},"minecraft:custom_model_data":{strings:["vexp:dried_glow_berries"]},"minecraft:item_name":{text:"Bayas luminosas secas",italic:false},food:{nutrition:3,saturation:0.3f}}}

# Beetroot
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:beetroot"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:beetroot"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"dried_beetroot"}},"minecraft:custom_model_data":{strings:["vexp:dried_beetroot"]},"minecraft:item_name":{text:"Remolacha seca",italic:false},food:{nutrition:3,saturation:0.3f}}}

# Melon Slice
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:melon_slice"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:melon_slice"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"dried_melon_slice"}},"minecraft:custom_model_data":{strings:["vexp:dried_melon_slice"]},"minecraft:item_name":{text:"Rodaja de sandía deshidratada",italic:false},food:{nutrition:3,saturation:0.4}}}

# Brown mushroom
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:brown_mushroom"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:brown_mushroom"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"roasted_brown_mushroom"}},"minecraft:custom_model_data":{strings:["vexp:roasted_brown_mushroom"]},"minecraft:item_name":{text:"Champiñón marrón asado",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Red mushroom
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:red_mushroom"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:red_mushroom"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"roasted_red_mushroom"}},"minecraft:custom_model_data":{strings:["vexp:roasted_red_mushroom"]},"minecraft:item_name":{text:"Champiñón rojo asado",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Bread
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:bread"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:bread"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"fried_bread"}},"minecraft:custom_model_data":{strings:["vexp:fried_bread"]},"minecraft:item_name":{text:"Pan frito",italic:false},food:{nutrition:6,saturation:0.7f}}}

# Egg
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:egg"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:egg"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_egg"}},"minecraft:custom_model_data":{strings:["vexp:cooked_egg"]},"minecraft:item_name":{text:"Huevo cocinado",italic:false},food:{nutrition:4,saturation:0.5}}}

# Brown egg
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:brown_egg"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:brown_egg"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_egg"}},"minecraft:custom_model_data":{strings:["vexp:cooked_egg"]},"minecraft:item_name":{text:"Huevo cocinado",italic:false},food:{nutrition:4,saturation:0.5}}}

# Blue egg
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:blue_egg"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:blue_egg"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_egg"}},"minecraft:custom_model_data":{strings:["vexp:cooked_egg"]},"minecraft:item_name":{text:"Huevo cocinado",italic:false},food:{nutrition:4,saturation:0.5}}}

# Custom cutted food
# Beef Strip
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:rabbit_foot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"beef_strip"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:rabbit_foot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"beef_strip"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_beef_strip"}},"minecraft:custom_model_data":{strings:["vexp:cooked_beef_strip"]},"minecraft:item_name":{text:"Tira de ternera asada",italic:false},food:{nutrition:4,saturation:0.5f}}}

# Chicken breast
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:ghast_tear",components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_breast"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:ghast_tear",components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_breast"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_chicken_breast"}},"minecraft:custom_model_data":{strings:["vexp:cooked_chicken_breast"]},"minecraft:item_name":{text:"Pechuga de pollo asada",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Chicken drumstick
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:phantom_membrane",components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_drumstick"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:phantom_membrane",components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_drumstick"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_chicken_drumstick"}},"minecraft:custom_model_data":{strings:["vexp:cooked_chicken_drumstick"]},"minecraft:item_name":{text:"Muslo de pollo asado",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Porkchop Strip
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:armadillo_scute",components:{"minecraft:custom_data":{vexp:{type:"food",id:"porkchop_strip"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:armadillo_scute",components:{"minecraft:custom_data":{vexp:{type:"food",id:"porkchop_strip"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_porkchop_strip"}},"minecraft:custom_model_data":{strings:["vexp:cooked_porkchop_strip"]},"minecraft:item_name":{text:"Tira de cerdo asado",italic:false},food:{nutrition:4,saturation:0.5f}}}

# Cod strip
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"cod_strip"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"cod_strip"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_cod_strip"}},"minecraft:custom_model_data":{strings:["vexp:cooked_cod_strip"]},"minecraft:item_name":{text:"Tira de bacalao asado",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Salmon Strip
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"salmon_strip"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"salmon_strip"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_salmon_strip"}},"minecraft:custom_model_data":{strings:["vexp:cooked_salmon_strip"]},"minecraft:item_name":{text:"Tira de salmón asado",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Pufferfish Strip
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"pufferfish_strip"}}}} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"pufferfish_strip"}}}} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:golden_carrot",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cooked_pufferfish_strip"}},"minecraft:custom_model_data":{strings:["vexp:cooked_pufferfish_strip"]},"minecraft:item_name":{text:"Tira de pez globo asado",italic:false},food:{nutrition:3,saturation:0.4f}}}

# Cocina vanilla
# Chicken
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:chicken"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:chicken"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_chicken",count:1}

# Beef
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:beef"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:beef"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_beef",count:1}

# Porckchop
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:porkchop"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:porkchop"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_porkchop",count:1}

# Mutton
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:mutton"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:mutton"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_mutton",count:1}

# Potato
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:potato"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:potato"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:baked_potato",count:1}

# Cod
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:cod"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:cod"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_cod",count:1}

# Salmon
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:salmon"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:salmon"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_salmon",count:1}

# Rabbit
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:rabbit"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:rabbit"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:cooked_rabbit",count:1}

# Kelp
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:kelp"} run scoreboard players set #did_cook vexp.math 1
execute if score @s vexp.cook_time matches 60.. if data entity @s data.vexp.pan_item{id:"minecraft:kelp"} run data modify entity @s data.vexp.pan_item set value {id:"minecraft:dried_kelp",count:1}

