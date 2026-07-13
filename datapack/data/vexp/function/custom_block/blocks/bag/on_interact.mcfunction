# interact.mcfunction
# Se ejecuta AS la interaction de la bolsa (vexp.custom_block.interact)

# 1. Identificar al jugador que interactua
execute on target run tag @s add vexp.bag_user
#scoreboard players set #bag_take_all vexp.math 0

# Bolsa abierta
# 1. Mano vacia: recoger 1 item
execute if entity @s[tag=vexp.bag_opened] unless entity @a[tag=vexp.bag_user,limit=1,predicate=vexp:is_sneaking] unless data entity @a[tag=vexp.bag_user,limit=1] SelectedItem run function vexp:custom_block/blocks/bag/take_one

# 2. Mano con item: intentar insertar
execute if entity @s[tag=vexp.bag_opened] unless entity @a[tag=vexp.bag_user,limit=1,predicate=vexp:is_sneaking] if data entity @a[tag=vexp.bag_user,limit=1] SelectedItem run function vexp:custom_block/blocks/bag/add_item

# 2. Mano vacia + sneaking: recoger todo
#execute store result score #bag_items vexp.math run data get entity @s data.vexp.item_count
#execute if entity @s[tag=vexp.bag_opened] if entity @a[tag=vexp.bag_user,limit=1,predicate=vexp:is_sneaking] unless data entity @a[tag=vexp.bag_user,limit=1] SelectedItem if score #bag_items vexp.math matches 1.. run function vexp:custom_block/blocks/bag/take_all
#execute if entity @s[tag=vexp.bag_opened] if entity @a[tag=vexp.bag_user,limit=1,predicate=vexp:is_sneaking] unless data entity @a[tag=vexp.bag_user,limit=1] SelectedItem if score #bag_items vexp.math matches 1.. run scoreboard players set #bag_take_all vexp.math 1

# Estado de la bolsa
# 1. Cerrar bolsa
execute if entity @s[tag=vexp.bag_opened] if entity @a[tag=vexp.bag_user,limit=1,predicate=vexp:is_sneaking] run function vexp:custom_block/blocks/bag/bag_close

# 2. Abrir bolsa
execute unless entity @s[tag=vexp.bag_opened] unless entity @a[tag=vexp.bag_user,limit=1,predicate=vexp:is_sneaking] run function vexp:custom_block/blocks/bag/bag_open

# Sólo feedback cuando está cerrada
execute unless entity @s[tag=vexp.bag_opened] run function vexp:custom_block/macro/sound {sound:"minecraft:block.wool.hit"}

# 7. Animacion
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

# 8. Cleanup
tag @a[tag=vexp.bag_user,limit=1] remove vexp.bag_user
