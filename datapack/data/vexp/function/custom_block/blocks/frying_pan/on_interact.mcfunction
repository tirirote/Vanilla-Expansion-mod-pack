# Se ejecuta AS la interaction de la sarten

# Identificar al jugador que interactua
execute on target run tag @s add vexp.frying_pan_user
data remove storage vexp:custom_block frying_pan_pickup

# Mano vacia: recuperar el item guardado
execute unless data entity @a[tag=vexp.frying_pan_user,limit=1] SelectedItem unless data entity @s data.vexp.pan_item run function vexp:custom_block/macro/sound {sound:"minecraft:block.lantern.hit"}
execute unless data entity @a[tag=vexp.frying_pan_user,limit=1] SelectedItem run function vexp:custom_block/blocks/frying_pan/pickup_cooked_item

# Mano con item: insertar uno si la sarten esta vacia
execute if data entity @a[tag=vexp.frying_pan_user,limit=1] SelectedItem unless data entity @s data.vexp.pan_item run function vexp:custom_block/blocks/frying_pan/insert_new_item

# 4. Añadir animación de jitter
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

# Limpieza
tag @a[tag=vexp.frying_pan_user,limit=1] remove vexp.frying_pan_user
