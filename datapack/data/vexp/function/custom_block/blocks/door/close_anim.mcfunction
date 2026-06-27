# Capturar ID para encontrar el display vinculado
execute if score @s vexp.block_anim matches 4 run function vexp:custom_block/macro/sound {sound:"minecraft:block.wooden_door.close"}

# Closing animation for single door/right door
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.translation set value [-0.4375f,0.47f,-0.4375f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s interpolation_duration set value 2

#Rotation Animation
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0.707f,0f,1f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 6..7 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1.707f,0f,0.303f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches 3..5 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0.707f,0f,-0.303f]
execute if entity @s[tag=!vexp.neighbour.left] if score @s vexp.block_anim matches ..2 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,707f,0f,0f]

# Close animation for left door
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.translation set value [0.4375f,0.47f,-0.375f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s interpolation_duration set value 2

#Rotation Animation
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0.707f,0f,-1f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 6..7 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,1.707f,0f,-0.303f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches 3..5 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0.707f,0f,0.303f]
execute if entity @s[tag=vexp.neighbour.left] if score @s vexp.block_anim matches ..2 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,707f,0f,0f]

scoreboard players remove @s vexp.block_anim 1
execute if score @s vexp.block_anim matches 1 run tag @s remove vexp.close_door_anim
