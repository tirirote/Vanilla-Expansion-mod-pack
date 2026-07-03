# locked_anim.mcfunction
# Ejecutar AS la interaction de la puerta bloqueada.
# Feedback rapido de "tiron" cuando intentas abrir una puerta con candado.

# Door derecha/simple
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 8 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s interpolation_duration set value 1
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 8 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0.95f,0f,0.1f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 6..7 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1.303f,0f,-0.1f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 4..5 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0.05f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches ..3 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

# Door izquierda
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 8 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s interpolation_duration set value 1
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 8 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0.95f,0f,-0.1f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 6..7 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1.303f,0f,0.1f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 4..5 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1f,0f,-0.05f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches ..3 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

scoreboard players remove @s vexp.block_anim 1
execute if score @s vexp.block_anim matches 1 run tag @s remove vexp.locked_door_anim
