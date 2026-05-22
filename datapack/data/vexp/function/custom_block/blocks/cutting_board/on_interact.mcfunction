# Se ejecuta AS la interaction de la tabla de cortar

# Identificar al jugador que interactua
tag @a[tag=vexp.cutting_board_user] remove vexp.cutting_board_user
execute on target run tag @s add vexp.cutting_board_user

# 1) Si hay item sobre la tabla y el jugador tiene espada, intentar cortar
execute if data entity @s data.vexp.board_item if items entity @a[tag=vexp.cutting_board_user,limit=1] weapon.mainhand #minecraft:swords run function vexp:custom_block/blocks/cutting_board/cut_item

# 2) Mano vacia: recuperar el item guardado
execute unless items entity @a[tag=vexp.cutting_board_user,limit=1] weapon.mainhand #minecraft:swords if data entity @s data.vexp.board_item if data entity @a[tag=vexp.cutting_board_user,limit=1] {} unless data entity @a[tag=vexp.cutting_board_user,limit=1] SelectedItem run function vexp:custom_block/blocks/cutting_board/pickup_item

# 3) Mano con item: insertar uno si la tabla esta vacia
execute if data entity @a[tag=vexp.cutting_board_user,limit=1] SelectedItem unless data entity @s data.vexp.board_item run function vexp:custom_block/blocks/cutting_board/insert_new_item

# Limpieza
tag @a[tag=vexp.cutting_board_user] remove vexp.cutting_board_user
