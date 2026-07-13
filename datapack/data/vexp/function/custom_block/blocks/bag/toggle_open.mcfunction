# Alternar estado abierto/cerrado de la bolsa

execute if entity @s[tag=vexp.bag_opened] run tag @s remove vexp.bag_opened
execute unless entity @s[tag=vexp.bag_opened] run tag @s add vexp.bag_opened

function vexp:custom_block/blocks/bag/bag_apply_display_model
function vexp:custom_block/macro/sound {sound:"minecraft:item.armor.equip_leather"}
