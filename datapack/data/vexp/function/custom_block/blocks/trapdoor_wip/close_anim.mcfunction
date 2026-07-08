# close_anim.mcfunction
# Animación de cierre suave de trapdoor.

execute if score @s vexp.block_anim matches 4 run function vexp:custom_block/macro/sound {sound:"minecraft:block.wooden_trapdoor.close"}

execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s interpolation_duration set value 2

# Fixed translation
execute if score @s vexp.block_anim matches 9 if data entity @s data.vexp{trap_half:"bottom"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.translation set value [0f,0.045f,-0.435f]
execute if score @s vexp.block_anim matches 9 if data entity @s data.vexp{trap_half:"top"} as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.translation set value [0f,0.955f,-0.435f]


execute if score @s vexp.block_anim matches 9 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [1.1f,0f,0f,-1f]
execute if score @s vexp.block_anim matches 6..7 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0.85f,0f,0f,-0.303f]
execute if score @s vexp.block_anim matches 3..5 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0.303f,0f,0f,0.707f]
execute if score @s vexp.block_anim matches ..2 as @e[type=item_display,tag=vexp.custom_block.display,distance=..1,sort=nearest,limit=1] run data modify entity @s transformation.left_rotation set value [0f,0f,0f,1f]
execute if score @s vexp.block_anim matches ..2 run function vexp:custom_block/blocks/trapdoor/apply_display_anchor

scoreboard players remove @s vexp.block_anim 1
execute if score @s vexp.block_anim matches 1 run tag @s remove vexp.close_trapdoor_anim
