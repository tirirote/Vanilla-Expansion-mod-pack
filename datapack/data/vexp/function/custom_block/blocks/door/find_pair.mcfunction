# Ejecutar AS la interaction de la puerta
# Encuentra puerta gemela lateral inmediata y etiqueta vexp.tmp_door_pair.

scoreboard players operation #temp vexp.id = @s vexp.id
tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair

execute if entity @s[y_rotation=-45..45] positioned ~1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=-45..45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=-45..45] positioned ~-1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=-45..45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair

execute if entity @s[y_rotation=136..180] positioned ~1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=136..180,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=136..180] positioned ~-1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=136..180,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute if entity @s[y_rotation=-180..-136] positioned ~1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=-180..-136,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=-180..-136] positioned ~-1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=-180..-136,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair

execute if entity @s[y_rotation=45..135] positioned ~ ~ ~1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=45..135,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=45..135] positioned ~ ~ ~-1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=45..135,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair

execute if entity @s[y_rotation=-135..-45] positioned ~ ~ ~1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=-135..-45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=-135..-45] positioned ~ ~ ~-1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.55,y_rotation=-135..-45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
