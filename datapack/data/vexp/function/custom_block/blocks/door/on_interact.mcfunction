# on_interact.mcfunction
# Ejecutar AS la interaction de la puerta

# Toggle de estado (sin doble ejecucion)
tag @s remove vexp.tmp_door_open
execute if data entity @s data.vexp{door_open:1b} run tag @s add vexp.tmp_door_open

# Buscar puerta gemela cercana (doble puerta)
scoreboard players operation #temp vexp.id = @s vexp.id
tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair
tag @s remove vexp.neighbour.left
tag @s remove vexp.neighbour.right

# Buscar solo vecino lateral inmediato (misma orientación) con distancia corta
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

# Vincular lados left/right para controlar espejo del vecino
execute if entity @s[y_rotation=-45..45] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=-45..45] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=136..180] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=136..180] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=-180..-136] positioned ~1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=-180..-136] positioned ~-1 ~ ~ if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=45..135] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right
execute if entity @s[y_rotation=45..135] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=-135..-45] positioned ~ ~ ~1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.left
execute if entity @s[y_rotation=-135..-45] positioned ~ ~ ~-1 if entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..0.1,limit=1] run tag @s add vexp.neighbour.right

tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.left
tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] remove vexp.neighbour.right

execute if entity @s[tag=vexp.neighbour.left] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.right
execute if entity @s[tag=vexp.neighbour.right] run tag @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] add vexp.neighbour.left

execute unless entity @s[tag=vexp.neighbour.left] if entity @s[tag=vexp.tmp_door_open] run function vexp:custom_block/blocks/door/close
execute unless entity @s[tag=vexp.neighbour.left] unless entity @s[tag=vexp.tmp_door_open] run function vexp:custom_block/blocks/door/open

# Sincronizar gemela sin duplicar sonido
execute unless entity @s[tag=vexp.neighbour.left] if entity @s[tag=vexp.tmp_door_open] as @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] at @s run function vexp:custom_block/blocks/door/close_sync
execute unless entity @s[tag=vexp.neighbour.left] unless entity @s[tag=vexp.tmp_door_open] as @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] at @s run function vexp:custom_block/blocks/door/open_sync

tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair

tag @s remove vexp.tmp_door_open
