# store_door_target.mcfunction
# Se ejecuta AS una puerta candidata. Guarda su id dentro del candado nuevo.

execute store result entity @e[type=interaction,tag=vexp.lock_new,sort=nearest,limit=1,distance=..2.0] data.vexp.door_id int 1 run data get entity @s data.vexp.vexp_id
data modify entity @e[type=interaction,tag=vexp.lock_new,sort=nearest,limit=1,distance=..2.0] data.vexp.target_type set value "door"
