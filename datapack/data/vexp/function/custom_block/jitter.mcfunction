#1. Custom Jitter animation
execute if score @s vexp.block_anim matches 9 run data modify entity @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] transformation.left_rotation set value [0f,0.05f,0f,1f]
execute if score @s vexp.block_anim matches 6..8 run data modify entity @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] transformation.left_rotation set value [0f,-0.101f,0f,1f]
execute if score @s vexp.block_anim matches 3..5 run data modify entity @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] transformation.left_rotation set value [0f,0.05f,0f,1f]
execute if score @s vexp.block_anim matches 1..2 run data modify entity @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] transformation.left_rotation set value [0f,0f,0f,1f]

# 2. Custom Animation for child / inventory item display
execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.inventory_visual,distance=..1,sort=nearest] run data remove storage vexp:custom_block inventory_visual_original_rot
execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.inventory_visual,distance=..1,sort=nearest] run data modify storage vexp:custom_block inventory_visual_original_rot set from entity @s transformation.left_rotation
execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.inventory_visual,distance=..1,sort=nearest] run data modify entity @s transformation.left_rotation set value [-0.707f,0.707f,-0.101f,1f]
execute if score @s vexp.block_anim matches 5..8 as @e[type=item_display,tag=vexp.inventory_visual,distance=..1,sort=nearest] run data modify entity @s transformation.left_rotation set value [1.707f,0.101f,0.101f,1f]
execute if score @s vexp.block_anim matches 2..4 as @e[type=item_display,tag=vexp.inventory_visual,distance=..1,sort=nearest] run data modify entity @s transformation.left_rotation set value [0.707f,-0.103f,-0.103f,1f]
execute if score @s vexp.block_anim matches 1 as @e[type=item_display,tag=vexp.inventory_visual,distance=..1,sort=nearest] run data modify entity @s transformation.left_rotation set from storage vexp:custom_block inventory_visual_original_rot

#3. Remove 1 from the scoreboard
execute if score @s vexp.block_anim matches 1.. run scoreboard players remove @s vexp.block_anim 1

#4. Clean tag when done
execute if score @s vexp.block_anim matches 0 run tag @s remove vexp.block.jitter
