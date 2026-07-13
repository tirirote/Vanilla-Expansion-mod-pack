# on_interact_unlocked.mcfunction
# Ejecutar AS la interaction de la puerta (flujo original sin candado).

tag @a[tag=vexp.door_user] remove vexp.door_user
execute on target run tag @s add vexp.door_user

# Toggle de estado (sin doble ejecucion)
tag @s remove vexp.tmp_door_open
execute if entity @s[tag=vexp.door_opened] run tag @s add vexp.tmp_door_open

# Buscar puerta gemela cercana (doble puerta)
tag @s remove vexp.neighbour.left
tag @s remove vexp.neighbour.right
function vexp:custom_block/blocks/door/find_pair

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

execute if entity @s[tag=vexp.tmp_door_open] unless items entity @a[tag=vexp.door_user,limit=1,predicate=!vexp:is_sneaking] weapon.mainhand #axes run function vexp:custom_block/blocks/door/close_routed
execute unless entity @s[tag=vexp.tmp_door_open] unless items entity @a[tag=vexp.door_user,limit=1,predicate=!vexp:is_sneaking] weapon.mainhand #axes run function vexp:custom_block/blocks/door/open_routed

tag @e[type=interaction,tag=vexp.tmp_door_pair] remove vexp.tmp_door_pair

tag @a[tag=vexp.door_user] remove vexp.door_user

tag @s remove vexp.tmp_door_open
