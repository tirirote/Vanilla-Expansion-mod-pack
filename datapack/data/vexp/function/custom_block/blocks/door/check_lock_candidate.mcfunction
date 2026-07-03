# check_lock_candidate.mcfunction
# Se ejecuta AS un posible candado.

execute if score @s vexp.id = #door_current_id vexp.id unless data entity @s data.vexp{key_name:""} run tag @e[type=interaction,tag=vexp.door_checking,sort=nearest,limit=1,distance=..6.0] add vexp.door_locked
execute if score @s vexp.id = #door_current_id vexp.id unless data entity @s data.vexp{key_name:""} run data modify storage vexp:custom_block door_lock.key_name set from entity @s data.vexp.key_name
