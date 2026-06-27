# Mano con item: insertar uno si la sarten esta vacia
data remove storage vexp:custom_block item_held

data modify storage vexp:custom_block item_held set from entity @a[tag=vexp.frying_pan_user,limit=1] SelectedItem

execute if data storage vexp:custom_block item_held run data modify storage vexp:custom_block item_held.count set value 1

execute if data storage vexp:custom_block item_held run data modify entity @s data.vexp.pan_item set from storage vexp:custom_block item_held

execute if data storage vexp:custom_block item_held run item modify entity @a[tag=vexp.frying_pan_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}

execute if data storage vexp:custom_block item_held run data modify entity @s data.vexp.cook_time set value 0
execute if data storage vexp:custom_block item_held run scoreboard players set @s vexp.cook_time 0

#Spawn item
execute if data storage vexp:custom_block item_held run function vexp:custom_block/blocks/frying_pan/spawn_item_visual

#Sound Feedback
execute if data storage vexp:custom_block item_held run function vexp:custom_block/macro/sound {sound:"minecraft:entity.item_frame.add_item"}
