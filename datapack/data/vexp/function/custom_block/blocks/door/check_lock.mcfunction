# check_lock.mcfunction
# Se ejecuta AS la interaction de la puerta.

tag @s remove vexp.door_has_key
tag @s add vexp.door_checking

tag @a[tag=vexp.door_user] remove vexp.door_user
execute on target run tag @s add vexp.door_user

data remove storage vexp:custom_block door_lock

execute unless data entity @s data.vexp.has_lock run data modify entity @s data.vexp.has_lock set value 0
execute unless data entity @s data.vexp.key_name run data modify entity @s data.vexp.key_name set value ""

# Inicializacion: la primera llave que toque la puerta bloqueada fija el key_name.
function vexp:custom_block/blocks/door/init_key_name_from_held_key

execute if data entity @s data.vexp{has_lock:1} unless data entity @s data.vexp{key_name:""} run data modify storage vexp:custom_block door_lock.key_name set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{has_lock:1} unless data entity @s data.vexp{key_name:""} run function vexp:custom_block/blocks/door/check_lock_player_key_macro with storage vexp:custom_block door_lock

# Sonido al abrir la puerta con la llave
execute if entity @s[tag=vexp.door_has_key] run function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_trapdoor.open"}

execute if data entity @s data.vexp{has_lock:1,key_name:""} run tag @s add vexp.lock_blocked
execute if data entity @s data.vexp{has_lock:1} unless data entity @s data.vexp{key_name:""} if entity @s[tag=!vexp.door_has_key] run tag @s add vexp.lock_blocked

# Mensaje al intentar abrir la puerta bloqueada
execute if entity @s[tag=vexp.lock_blocked] run title @a[tag=vexp.door_user] actionbar [{"text":"¡Está bloqueada!","color":"white"}]
execute if entity @s[tag=vexp.lock_blocked] run function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_trapdoor.close"}

# Setup de la animación de bloqueo
execute if entity @s[tag=vexp.lock_blocked] run tag @s remove vexp.locked_door_anim
execute if entity @s[tag=vexp.lock_blocked] run tag @s add vexp.locked_door_anim
execute if entity @s[tag=vexp.lock_blocked] run scoreboard players set @s vexp.block_anim 8

tag @s remove vexp.door_checking
tag @s remove vexp.door_has_key
tag @a[tag=vexp.door_user] remove vexp.door_user
