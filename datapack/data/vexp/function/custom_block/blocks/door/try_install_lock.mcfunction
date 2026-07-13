# try_install_lock.mcfunction
# Si el jugador interactua con un candado en mano y la puerta no lo tiene, instala candado.

tag @s remove vexp.lock_install_success

tag @a[tag=vexp.door_user] remove vexp.door_user
execute on target run tag @s add vexp.door_user

execute unless data entity @s data.vexp.has_lock run data modify entity @s data.vexp.has_lock set value 0
execute unless data entity @s data.vexp.key_name run data modify entity @s data.vexp.key_name set value ""

execute if data entity @s data.vexp{has_lock:0} if items entity @a[tag=vexp.door_user,limit=1] weapon.mainhand item_frame[minecraft:custom_model_data={strings:["vexp:lock"]}] run function vexp:custom_block/blocks/door/install_lock

tag @a[tag=vexp.door_user] remove vexp.door_user
