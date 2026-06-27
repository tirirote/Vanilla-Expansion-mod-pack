# Inserta 1 item desde la mano del usuario a la tabla

data remove storage vexp:custom_block item_held
data modify storage vexp:custom_block item_held set from entity @a[tag=vexp.cutting_board_user,limit=1] SelectedItem

execute unless data storage vexp:custom_block item_held run return fail

execute if data storage vexp:custom_block item_held run data modify storage vexp:custom_block item_held.count set value 1
execute if data storage vexp:custom_block item_held run data modify entity @s data.vexp.board_item set from storage vexp:custom_block item_held

execute if data storage vexp:custom_block item_held run item modify entity @a[tag=vexp.cutting_board_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}

execute if data storage vexp:custom_block item_held run function vexp:custom_block/blocks/cutting_board/spawn_item_visual
execute if data storage vexp:custom_block item_held run function vexp:custom_block/macro/sound {sound:"minecraft:entity.item_frame.add_item"}
