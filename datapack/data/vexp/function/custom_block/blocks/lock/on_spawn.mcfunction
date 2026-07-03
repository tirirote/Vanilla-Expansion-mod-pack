# on_spawn.mcfunction
# Inicializa datos y vincula el candado al objetivo cercano (puerta o contenedor).

execute unless data entity @s data.vexp.key_name run data modify entity @s data.vexp.key_name set value ""
data modify entity @s data.vexp.target_type set value "none"
data modify entity @s data.vexp.target_offset set value "none"
data modify entity @s data.vexp.door_id set value 0

tag @s add vexp.lock_new
scoreboard players operation #lock_owner_id vexp.id = @s vexp.id

# Si no se encontro puerta, buscar contenedor vanilla alrededor.
execute if data entity @s data.vexp{target_type:"none"} run function vexp:custom_block/blocks/lock/store_container_target

# Dropear si está colocado mal
execute if data entity @s data.vexp{target_type:"none"} if data entity @s data.vexp{target_offset:"none"} run function vexp:custom_block/break with entity @s data.vexp

tag @s remove vexp.lock_new
