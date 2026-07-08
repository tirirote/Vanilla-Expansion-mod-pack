#Initial Placement

# Update doors display
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:0,transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[-0.435f,0.47f,-0.4375f],scale:[1f,1f,1f]}}

# Colocar puerta orientada (parte inferior y superior)
function vexp:custom_block/blocks/door/place_closed_door_block
