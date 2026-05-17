# on_break.mcfunction
# Limpia entidades auxiliares del waypoint.

scoreboard players operation #waypoint_id vexp.id = @s vexp.id

# Restaura el nombre personalizado del waypoint al romper el bloque.
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..3] if score @s vexp.id = #waypoint_id vexp.id run data modify entity @e[type=item,distance=..3,limit=1,sort=nearest] Item.components."minecraft:custom_name" set from entity @s data.vexp.custom_name

execute as @e[type=text_display,tag=vexp.waypoint.name,distance=..3] if score @s vexp.id = #waypoint_id vexp.id run kill @s
