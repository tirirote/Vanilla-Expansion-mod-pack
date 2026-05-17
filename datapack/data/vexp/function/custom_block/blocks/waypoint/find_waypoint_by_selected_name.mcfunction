# find_waypoint_by_selected_name.mcfunction
# Macro: busca waypoint por nombre seleccionado en radio 256.
# Input: $(name)
# Contexto: se ejecuta AS el jugador.

$execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..256,sort=nearest,limit=1,nbt={data:{vexp:{custom_name:$(name)}}}] if data entity @s data.vexp{id:"waypoint"} run data modify storage vexp:waypoint display.pos set from entity @s Pos
$execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..256,sort=nearest,limit=1,nbt={data:{vexp:{custom_name:$(name)}}}] if data entity @s data.vexp{id:"waypoint"} run data modify storage vexp:waypoint display.name set from entity @s data.vexp.custom_name
$execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..256,sort=nearest,limit=1,nbt={data:{vexp:{custom_name:$(name)}}}] if data entity @s data.vexp{id:"waypoint"} store result entity @s data.vexp.wp_id int 1 run scoreboard players get #selected_wp_id vexp.id
