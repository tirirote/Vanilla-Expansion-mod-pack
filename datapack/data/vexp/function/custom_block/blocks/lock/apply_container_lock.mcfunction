# apply_container_lock.mcfunction
execute if data entity @s data.vexp{target_offset:"east"} if block ~1 ~ ~ #vexp:lock_containers run data modify block ~1 ~ ~ lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{target_offset:"west"} if block ~-1 ~ ~ #vexp:lock_containers run data modify block ~-1 ~ ~ lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{target_offset:"south"} if block ~ ~ ~1 #vexp:lock_containers run data modify block ~ ~ ~1 lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{target_offset:"north"} if block ~ ~ ~-1 #vexp:lock_containers run data modify block ~ ~ ~-1 lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name

execute if data entity @s data.vexp{target_offset:"self"} if block ~1 ~ ~ #vexp:lock_containers run data modify block ~1 ~ ~ lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{target_offset:"self"} if block ~-1 ~ ~ #vexp:lock_containers run data modify block ~-1 ~ ~ lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{target_offset:"self"} if block ~ ~ ~1 #vexp:lock_containers run data modify block ~ ~ ~1 lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
execute if data entity @s data.vexp{target_offset:"self"} if block ~ ~ ~-1 #vexp:lock_containers run data modify block ~ ~ ~-1 lock.components."minecraft:custom_name" set from entity @s data.vexp.key_name
