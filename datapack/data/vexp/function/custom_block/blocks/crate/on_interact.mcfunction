# Ejecutar AS la interaction de la crate

# Identificar al jugador que interactua
execute on target run tag @s add vexp.crate_user

# Mano vacía: vaciar todo el contenido de la crate
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run scoreboard players operation #temp vexp.id = @s vexp.id
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem as @e[type=item_display,tag=vexp.crate.inventory,distance=..2] if score @s vexp.id = #temp vexp.id run kill @s
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run data remove storage vexp:custom_block crate_break
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run data modify storage vexp:custom_block crate_break.items set from entity @s data.vexp.Items
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem if data storage vexp:custom_block crate_break.items[0] at @s run function vexp:custom_block/blocks/crate/drop_items_loop
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run data remove entity @s data.vexp.Items
execute if data entity @a[tag=vexp.crate_user,limit=1] {} unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run data modify entity @s data.vexp.item_count set value 0

# Mano con item: intentar insertar en la crate
execute if data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run function vexp:custom_block/blocks/crate/add_item

# Limpieza
tag @a[tag=vexp.crate_user,sort=nearest,limit=1] remove vexp.crate_user
