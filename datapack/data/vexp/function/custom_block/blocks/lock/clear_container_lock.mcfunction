# clear_container_lock.mcfunction

execute if data entity @s data.vexp{target_offset:"self"} if block ~ ~ ~ #vexp:lock_containers run data remove block ~ ~ ~ lock
execute if data entity @s data.vexp{target_offset:"east"} if block ~1 ~ ~ #vexp:lock_containers run data remove block ~1 ~ ~ lock
execute if data entity @s data.vexp{target_offset:"west"} if block ~-1 ~ ~ #vexp:lock_containers run data remove block ~-1 ~ ~ lock
execute if data entity @s data.vexp{target_offset:"south"} if block ~ ~ ~1 #vexp:lock_containers run data remove block ~ ~ ~1 lock
execute if data entity @s data.vexp{target_offset:"north"} if block ~ ~ ~-1 #vexp:lock_containers run data remove block ~ ~ ~-1 lock
execute if data entity @s data.vexp{target_offset:"up"} if block ~ ~1 ~ #vexp:lock_containers run data remove block ~ ~1 ~ lock
execute if data entity @s data.vexp{target_offset:"down"} if block ~ ~-1 ~ #vexp:lock_containers run data remove block ~ ~-1 ~ lock
