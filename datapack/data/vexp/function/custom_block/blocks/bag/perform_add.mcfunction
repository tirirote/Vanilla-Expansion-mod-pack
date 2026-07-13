# perform_add.mcfunction
# Se ejecuta AS la interaction

execute store result score #prev vexp.math run data get entity @s data.vexp.item_count
scoreboard players operation #temp vexp.math = #prev vexp.math
scoreboard players add #temp vexp.math 1
execute store result entity @s data.vexp.item_count int 1 run scoreboard players get #temp vexp.math

# Si estaba vacia, registrar tipo base
execute if score #prev vexp.math matches 0 run function vexp:custom_block/blocks/bag/set_content_from_held

function vexp:custom_block/blocks/bag/bag_apply_fill_state
function vexp:custom_block/blocks/bag/bag_apply_display_model

# Descontar del jugador
item modify entity @a[tag=vexp.bag_user,limit=1] weapon.mainhand { "function": "minecraft:set_count", "count": -1, "add": true }

function vexp:custom_block/macro/sound {sound:"minecraft:item.armor.equip_leather"}
particle dust_plume ~ ~1 ~ 0.1 0.1 0.1 0.005 1
