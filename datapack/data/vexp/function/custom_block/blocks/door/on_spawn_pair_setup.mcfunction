# on_spawn_pair_setup.mcfunction
# Ejecutar AS la interaction recien creada
# Configura pareja left/right y aplica init del modelo derecho una sola vez

scoreboard players operation #temp vexp.id = @s vexp.id
tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair
tag @s remove vexp.neighbour.left
tag @s remove vexp.neighbour.right

# Buscar vecino lateral inmediato con misma orientacion
execute if entity @s[y_rotation=-45..45] positioned ~1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=-45..45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=-45..45] positioned ~-1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=-45..45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute if entity @s[y_rotation=136..180] positioned ~1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=136..180,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=136..180] positioned ~-1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=136..180,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute if entity @s[y_rotation=-180..-136] positioned ~1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=-180..-136,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=-180..-136] positioned ~-1 ~ ~ as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=-180..-136,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute if entity @s[y_rotation=45..135] positioned ~ ~ ~1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=45..135,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=45..135] positioned ~ ~ ~-1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=45..135,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute if entity @s[y_rotation=-135..-45] positioned ~ ~ ~1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=-135..-45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair
execute unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2] if entity @s[y_rotation=-135..-45] positioned ~ ~ ~-1 as @e[type=interaction,tag=vexp.custom_block.interact,nbt={data:{vexp:{type:"door"}}},distance=..0.1,y_rotation=-135..-45,sort=nearest,limit=1] unless score @s vexp.id = #temp vexp.id run tag @s add vexp.tmp_door_pair

# Asignar lado left/right
execute if entity @s[y_rotation=-45..45] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=-45..45] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=136..180] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=136..180] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=-180..-136] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=-180..-136] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=45..135] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=45..135] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=-135..-45] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=-135..-45] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right

tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.left
tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.right
execute if entity @s[tag=vexp.neighbour.left] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.right
execute if entity @s[tag=vexp.neighbour.right] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.left

# Flip inicial solo una vez para puerta derecha
execute if entity @s[tag=vexp.neighbour.right,tag=!vexp.right_model_initialized] run function vexp:custom_block/blocks/door/init_right_model
execute as @e[type=interaction,tag=vexp.tmp_door_pair,tag=vexp.neighbour.right,tag=!vexp.right_model_initialized,sort=nearest,limit=1] run function vexp:custom_block/blocks/door/init_right_model

tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair
