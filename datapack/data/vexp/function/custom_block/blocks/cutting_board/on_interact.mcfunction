# Se ejecuta AS la interaction de la tabla de cortar

# Identificar al jugador que interactua
tag @a[tag=vexp.cutting_board_user] remove vexp.cutting_board_user
execute on target run tag @s add vexp.cutting_board_user

# 1) Si hay item sobre la tabla y el jugador tiene espada, intentar cortar
execute if data entity @s data.vexp.board_item if items entity @a[tag=vexp.cutting_board_user,limit=1] weapon.mainhand #minecraft:swords run function vexp:custom_block/blocks/cutting_board/cut_item

# 2) Mano vacia: recuperar el item guardado
execute unless items entity @a[tag=vexp.cutting_board_user,limit=1] weapon.mainhand #minecraft:swords unless data entity @s data.vexp.board_item unless data entity @a[tag=vexp.cutting_board_user,limit=1] SelectedItem run function vexp:custom_block/macro/sound {sound:"minecraft:block.wood.place"}
execute unless items entity @a[tag=vexp.cutting_board_user,limit=1] weapon.mainhand #minecraft:swords if data entity @s data.vexp.board_item unless data entity @a[tag=vexp.cutting_board_user,limit=1] SelectedItem run function vexp:custom_block/blocks/cutting_board/pickup_item

# 3) Mano con item: insertar uno si la tabla esta vacia
execute if data entity @a[tag=vexp.cutting_board_user,limit=1] SelectedItem unless data entity @s data.vexp.board_item run function vexp:custom_block/blocks/cutting_board/insert_new_item

# 4. Añadir animación de jitter
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

# Limpieza
tag @a[tag=vexp.cutting_board_user] remove vexp.cutting_board_user
