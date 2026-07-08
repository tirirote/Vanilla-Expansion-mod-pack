# on_interact.mcfunction
# Se ejecuta AS la interaction del candado.

tag @a[tag=vexp.lock_user] remove vexp.lock_user
execute on target run tag @s add vexp.lock_user

# Inicializar key_name desde item_name de la llave si todavia no existe.
execute if data entity @s data.vexp{key_name:""} if items entity @a[tag=vexp.lock_user,limit=1] weapon.mainhand minecraft:poisonous_potato[minecraft:custom_data={vexp:{type:"key"}}] if data entity @a[tag=vexp.lock_user,limit=1] SelectedItem.components."minecraft:custom_name" run data modify entity @s data.vexp.key_name set from entity @a[tag=vexp.lock_user,limit=1] SelectedItem.components."minecraft:custom_name"

execute if data entity @s data.vexp{key_name:""} if items entity @a[tag=vexp.lock_user,limit=1] weapon.mainhand minecraft:poisonous_potato[minecraft:custom_data={vexp:{type:"key"}}] unless data entity @a[tag=vexp.lock_user,limit=1] SelectedItem.components."minecraft:custom_name" run data modify entity @s data.vexp.key_name set from entity @a[tag=vexp.lock_user,limit=1] SelectedItem.components."minecraft:item_name".text

# Si se inicializo la llave y el candado esta sobre cofre/barril, aplicar lock vanilla.
execute unless data entity @s data.vexp{key_name:""} if data entity @s data.vexp{target_type:"container"} run function vexp:custom_block/blocks/lock/apply_container_lock

# Feedback rapido
execute unless data entity @s data.vexp{key_name:""} run function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_trapdoor.open"}
execute if data entity @s data.vexp{key_name:""} run function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_trapdoor.close"}

# Añadir animación de jitter
tag @s add vexp.block.jitter
scoreboard players set @s vexp.block_anim 10

tag @a[tag=vexp.lock_user] remove vexp.lock_user
