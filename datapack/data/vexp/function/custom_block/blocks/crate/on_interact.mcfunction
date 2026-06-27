# Ejecutar AS la interaction de la crate

# Identificar al jugador que interactua
execute on target run tag @s add vexp.crate_user

# Mano vacía: vaciar todo el contenido de la crate
execute unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run function vexp:custom_block/blocks/crate/empty_crate
execute unless data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run function vexp:custom_block/macro/sound {sound:"minecraft:entity.armor_stand.break"}

# Mano con item: intentar insertar en la crate
execute if data entity @a[tag=vexp.crate_user,limit=1] SelectedItem run function vexp:custom_block/blocks/crate/add_item

# 4. Añadir animación de jitter
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

# Limpieza
tag @a[tag=vexp.crate_user,sort=nearest,limit=1] remove vexp.crate_user
