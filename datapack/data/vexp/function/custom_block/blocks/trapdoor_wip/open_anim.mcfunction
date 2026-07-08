# open_anim.mcfunction
# Animación de apertura suave de trapdoor.

execute if score @s vexp.block_anim matches 9 run function vexp:custom_block/macro/sound {sound:"minecraft:block.wooden_trapdoor.open"}

execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s interpolation_duration set value 2

# Fixed translation
execute if score @s vexp.block_anim matches 9 if data entity @s data.vexp{trap_half:"bottom"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.translation set value [0f,0.03f,-0.39f]
execute if score @s vexp.block_anim matches 9 if data entity @s data.vexp{trap_half:"top"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.translation set value [0f,0.97f,-0.39f]

# Rotation Animation
execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0.1f,0f,0f,0.95f]
execute if score @s vexp.block_anim matches 6..7 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0.85f,0f,0f,-0.303f]
execute if score @s vexp.block_anim matches 3..5 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [1f,0f,0f,-1.1f]
execute if score @s vexp.block_anim matches ..2 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [1f,0f,0f,-1f]

scoreboard players remove @s vexp.block_anim 1
execute if score @s vexp.block_anim matches 1 run tag @s remove vexp.open_trapdoor_anim
