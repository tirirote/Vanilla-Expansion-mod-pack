# Transformaciones de corte en porciones

execute if data entity @s data.vexp.board_item{id:"minecraft:bread"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:4,components:{"minecraft:custom_data":{vexp:{type:"food",id:"sliced_bread"}},"minecraft:custom_model_data":{strings:["vexp:sliced_bread"]},"minecraft:item_name":{text:"Pan en rebanadas",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:bread"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:cake"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:7,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cake_slice"}},"minecraft:custom_model_data":{strings:["vexp:cake_slice"]},"minecraft:item_name":{text:"Porción de tarta",italic:false},food:{nutrition:2,saturation:0.2f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:cake"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:pumpkin_pie"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:4,components:{"minecraft:custom_data":{vexp:{type:"food",id:"pumpkin_pie_slice"}},"minecraft:custom_model_data":{strings:["vexp:pumpkin_pie_slice"]},"minecraft:item_name":{text:"Porción de tarta de calabaza",italic:false},food:{nutrition:2,saturation:0.2f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:pumpkin_pie"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:beef"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:rabbit_foot",count:2,components:{"minecraft:custom_data":{vexp:{type:"food",id:"beef_strip"}},"minecraft:custom_model_data":{strings:["vexp:beef_strip"]},"minecraft:item_name":{text:"Tira de ternera",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:beef"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:porkchop"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:armadillo_scute",count:2,components:{"minecraft:custom_data":{vexp:{type:"food",id:"porkchop_strip"}},"minecraft:custom_model_data":{strings:["vexp:porkchop_strip"]},"minecraft:item_name":{text:"Tira de cerdo",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:porkchop"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:chicken"} at @s run summon item ~ ~0.5 ~ {Tags:["vexp.cutting_board.loot"],PickupDelay:0,Item:{id:"minecraft:phantom_membrane",count:2,components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_drumstick"}},"minecraft:custom_model_data":{strings:["vexp:chicken_drumstick"]},"minecraft:item_name":{text:"Muslo de pollo",italic:false},food:{nutrition:2,saturation:0.2f}}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:chicken"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:ghast_tear",count:1,components:{"minecraft:custom_data":{vexp:{type:"food",id:"chicken_breast"}},"minecraft:custom_model_data":{strings:["vexp:chicken_breast"]},"minecraft:item_name":{text:"Pechuga de pollo",italic:false},food:{nutrition:2,saturation:0.2f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:chicken"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:cod"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:2,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cod_strip"}},"minecraft:custom_model_data":{strings:["vexp:cod_strip"]},"minecraft:item_name":{text:"Tira de bacalao",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:cod"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:salmon"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:2,components:{"minecraft:custom_data":{vexp:{type:"food",id:"salmon_strip"}},"minecraft:custom_model_data":{strings:["vexp:salmon_strip"]},"minecraft:item_name":{text:"Tira de salmón",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:salmon"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:pufferfish"} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:2,components:{"minecraft:custom_data":{vexp:{type:"food",id:"pufferfish_strip"}},"minecraft:custom_model_data":{strings:["vexp:pufferfish_strip"]},"minecraft:item_name":{text:"Tira de pez globo",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:pufferfish"} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"brownie"}}}} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:4,components:{"minecraft:custom_data":{vexp:{type:"food",id:"brownie_slice"}},"minecraft:custom_model_data":{strings:["vexp:brownie_slice"]},"minecraft:item_name":{text:"Porción de brownie",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"brownie"}}}} run scoreboard players set #did_cut vexp.math 1

execute if data entity @s data.vexp.board_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"cheese"}}}} run data modify entity @s data.vexp.board_item set value {id:"minecraft:golden_carrot",count:4,components:{"minecraft:custom_data":{vexp:{type:"food",id:"cheese_slice"}},"minecraft:custom_model_data":{strings:["vexp:cheese_slice"]},"minecraft:item_name":{text:"Porción de queso",italic:false},food:{nutrition:2,saturation:0.25f}}}
execute if data entity @s data.vexp.board_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"cheese"}}}} run scoreboard players set #did_cut vexp.math 1
