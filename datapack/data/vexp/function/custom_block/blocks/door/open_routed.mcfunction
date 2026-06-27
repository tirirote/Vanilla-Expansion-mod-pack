# Ejecutar AS la interaction de la puerta
# Abre delegando en la hoja controladora cuando el executor es la hoja izquierda.

# OPEN: hoja izquierda (doble puerta)
execute if entity @s[tag=vexp.neighbour.left] as @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] unless entity @s[tag=vexp.door_opened] at @s run function vexp:custom_block/blocks/door/open
execute if entity @s[tag=vexp.neighbour.left] unless entity @s[tag=vexp.door_opened] if entity @e[type=interaction,tag=vexp.tmp_door_pair,tag=vexp.door_opened,sort=nearest,limit=1] run function vexp:custom_block/blocks/door/open_sync
execute if entity @s[tag=vexp.neighbour.left] unless entity @e[type=interaction,tag=vexp.tmp_door_pair,distance=..2,limit=1] run function vexp:custom_block/blocks/door/open

# OPEN: puerta simple o hoja controladora
execute if entity @s[tag=!vexp.neighbour.left] run function vexp:custom_block/blocks/door/open
execute if entity @s[tag=!vexp.neighbour.left] as @e[type=interaction,tag=vexp.tmp_door_pair,sort=nearest,limit=1] unless entity @s[tag=vexp.door_opened] at @s run function vexp:custom_block/blocks/door/open_sync
