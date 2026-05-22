# Whitelist de items cortables
execute if data entity @s data.vexp.board_item{id:"minecraft:bread"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:cake"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:pumpkin_pie"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:beef"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:porkchop"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:chicken"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:cod"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:salmon"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:pufferfish"} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"brownie"}}}} run scoreboard players set #can_cut vexp.math 1
execute if data entity @s data.vexp.board_item{id:"minecraft:golden_carrot",components:{"minecraft:custom_data":{vexp:{type:"food",id:"cheese"}}}} run scoreboard players set #can_cut vexp.math 1
