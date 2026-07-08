# initial_placement.mcfunction

# Update trapdoor display
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s start_interpolation set value 0
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s interpolation_duration set value 0
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s transformation.left_rotation set value [0f,0f,0f,1f]
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data modify entity @s transformation.right_rotation set value [0f,0f,0f,1f]
function vexp:custom_block/blocks/trapdoor/apply_display_anchor

# Colocar trapdoor orientada (open=false)
function vexp:custom_block/blocks/trapdoor/place_closed_trapdoor_block
