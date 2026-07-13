# Scrape door
execute if data entity @s data.vexp{model: "vexp:door_exposed_copper"} run function vexp:custom_block/blocks/door/update_copper_door {model: "vexp:door_copper", name: "Puerta de cobre", p_break: "minecraft:block{block_state:{Name:'minecraft:copper_door'}}"}
execute if data entity @s data.vexp{model: "vexp:door_weathered_copper"} run function vexp:custom_block/blocks/door/update_copper_door {model: "vexp:door_exposed_copper", name: "Puerta de cobre expuesto", p_break: "minecraft:block{block_state:{Name:'minecraft:exposed_copper_door'}}"}
execute if data entity @s data.vexp{model: "vexp:door_oxidized_copper"} run function vexp:custom_block/blocks/door/update_copper_door {model: "vexp:door_weathered_copper", name: "Puerta de cobre degradado", p_break: "minecraft:block{block_state:{Name:'minecraft:weathered_copper_door'}}"}

particle scrape ~ ~1 ~ 0.25 0.25 0.25 1 5
function vexp:custom_block/macro/sound {sound:"minecraft:item.axe.scrape"}
