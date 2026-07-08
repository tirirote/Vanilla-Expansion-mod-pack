# on_spawn.mcfunction
# Se ejecuta durante el spawn del bloque.

execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.trap_open set value 0b
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.trap_half set value "bottom"
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id run data modify entity @s data.vexp.trap_facing set value "south"

# Si el frame se coloco en techo (Facing:0), la trapdoor inicia en half=top.
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if data entity @s data.vexp{face:0b} run data modify entity @s data.vexp.trap_half set value "top"
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if data entity @s data.vexp{face:1b} run data modify entity @s data.vexp.trap_half set value "bottom"

# Facing base desde la rotacion cardinal de la interaction.
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if entity @s[y_rotation=-45..45] run data modify entity @s data.vexp.trap_facing set value "south"
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if entity @s[y_rotation=45..135] run data modify entity @s data.vexp.trap_facing set value "west"
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if entity @s[y_rotation=-135..-45] run data modify entity @s data.vexp.trap_facing set value "east"
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if entity @s[y_rotation=136..180] run data modify entity @s data.vexp.trap_facing set value "north"
execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id if entity @s[y_rotation=-180..-136] run data modify entity @s data.vexp.trap_facing set value "north"

execute as @e[type=interaction,tag=vexp.custom_block.interact,distance=..2] if score @s vexp.id = #global vexp.id at @s run function vexp:custom_block/blocks/trapdoor/initial_placement
