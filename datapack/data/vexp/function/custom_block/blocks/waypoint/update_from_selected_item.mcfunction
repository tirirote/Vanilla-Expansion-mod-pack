# update_from_selected_item.mcfunction
# Contexto: se ejecuta AS el jugador.
# Asigna wp_id lógico al item si falta y resuelve waypoint por ese ID.
# Si no encuentra waypoint por ID, cae a búsqueda por nombre para migrar legacy.

data remove storage vexp:waypoint display
data remove storage vexp:waypoint selected
scoreboard players set @s vexp.focus_wp 0

# Solo aplica si el item en mano es un marcador waypoint
execute unless data entity @s SelectedItem.components."minecraft:entity_data".data.vexp{id:"waypoint"} run return 0

# Asignar wp_id lógico al seleccionar por primera vez (sin wp_id o con wp_id=0)
execute unless score #waypoint_uid vexp.wpid matches 1.. run scoreboard players set #waypoint_uid vexp.wpid 1
scoreboard players set #selected_wp_id vexp.wpid 0
scoreboard players set #assign_wp_id vexp.wpid 0

execute unless data entity @s SelectedItem.components."minecraft:entity_data".data.vexp.wp_id run scoreboard players set #assign_wp_id vexp.wpid 1
execute if data entity @s SelectedItem.components."minecraft:entity_data".data.vexp{wp_id:0} run scoreboard players set #assign_wp_id vexp.wpid 1

execute if score #assign_wp_id vexp.wpid matches 1.. run scoreboard players operation #selected_wp_id vexp.wpid = #waypoint_uid vexp.wpid
execute if score #assign_wp_id vexp.wpid matches 1.. run data remove storage vexp:waypoint assign
execute if score #assign_wp_id vexp.wpid matches 1.. run data modify storage vexp:waypoint assign.entity_data set from entity @s SelectedItem.components."minecraft:entity_data"
execute if score #assign_wp_id vexp.wpid matches 1.. store result storage vexp:waypoint assign.entity_data.data.vexp.wp_id int 1 run scoreboard players get #selected_wp_id vexp.wpid
execute if score #assign_wp_id vexp.wpid matches 1.. run function vexp:custom_block/blocks/waypoint/match_selected_name with storage vexp:waypoint assign
execute if score #assign_wp_id vexp.wpid matches 1.. run scoreboard players add #waypoint_uid vexp.wpid 1

# Si no hubo asignación, usar wp_id existente del item
execute unless score #assign_wp_id vexp.wpid matches 1.. store result score #selected_wp_id vexp.wpid run data get entity @s SelectedItem.components."minecraft:entity_data".data.vexp.wp_id 1

# Capturar wp_id seleccionado
execute if score #selected_wp_id vexp.wpid matches 1.. store result storage vexp:waypoint selected.wp_id int 1 run scoreboard players get #selected_wp_id vexp.wpid
execute if score #selected_wp_id vexp.wpid matches 1.. run scoreboard players operation @s vexp.focus_wp = #selected_wp_id vexp.wpid

# Capturar nombre seleccionado (prioriza custom_name)
execute if data entity @s SelectedItem.components."minecraft:custom_name" run data modify storage vexp:waypoint selected.name set from entity @s SelectedItem.components."minecraft:custom_name"
execute unless data storage vexp:waypoint selected.name if data entity @s SelectedItem.components."minecraft:item_name" run data modify storage vexp:waypoint selected.name set from entity @s SelectedItem.components."minecraft:item_name"

# Buscar waypoint por wp_id lógico en un radio de 256 bloques respecto al jugador
scoreboard players operation #selected_wp_id vexp.id = @s vexp.focus_wp
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..256] if data entity @s data.vexp{id:"waypoint"} if data entity @s data.vexp.wp_id store result score @s vexp.dummy run data get entity @s data.vexp.wp_id 1
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..256] if data entity @s data.vexp{id:"waypoint"} if score @s vexp.dummy = #selected_wp_id vexp.id run data modify storage vexp:waypoint display.pos set from entity @s Pos
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..256] if data entity @s data.vexp{id:"waypoint"} if score @s vexp.dummy = #selected_wp_id vexp.id if data entity @s data.vexp.custom_name run data modify storage vexp:waypoint display.name set from entity @s data.vexp.custom_name
execute if data storage vexp:waypoint display.pos unless data storage vexp:waypoint display.name run data modify storage vexp:waypoint display.name set value {"text":"Marcador","italic":false}

# Fallback legacy: si no se encontró por wp_id, resolver por nombre y migrar el waypoint encontrado
execute unless data storage vexp:waypoint display.pos if data storage vexp:waypoint selected.name run function vexp:custom_block/blocks/waypoint/find_waypoint_by_selected_name with storage vexp:waypoint selected
execute unless data storage vexp:waypoint display.pos if score @s vexp.focus_wp matches 1.. run scoreboard players set @s vexp.focus_wp 0

# Si se encontró, mostrar actionbar
execute if data storage vexp:waypoint display.pos run function vexp:custom_block/blocks/waypoint/update_indicator_coords
