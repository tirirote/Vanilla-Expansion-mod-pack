# Comprobar si se hace scrape con el hacha

tag @a[tag=vexp.door_user] remove vexp.door_user
execute on target run tag @s add vexp.door_user

# Oxidación de puertas de cobre
execute if data entity @s data.vexp{model: "vexp:door_exposed_copper"} if items entity @a[tag=vexp.door_user,limit=1,predicate=vexp:is_sneaking] weapon.mainhand #axes run function vexp:custom_block/blocks/door/scrape_copper_door
execute if data entity @s data.vexp{model: "vexp:door_weathered_copper"} if items entity @a[tag=vexp.door_user,limit=1,predicate=vexp:is_sneaking] weapon.mainhand #axes run function vexp:custom_block/blocks/door/scrape_copper_door
execute if data entity @s data.vexp{model: "vexp:door_oxidized_copper"} if items entity @a[tag=vexp.door_user,limit=1,predicate=vexp:is_sneaking] weapon.mainhand #axes run function vexp:custom_block/blocks/door/scrape_copper_door

tag @a[tag=vexp.door_user] remove vexp.door_user
