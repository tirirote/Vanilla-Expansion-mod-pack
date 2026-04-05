# open_sync.mcfunction
# Igual que open, pero sin sonido para sincronizacion de puerta doble

data merge entity @s {data:{vexp:{door_open:1b}}}
tag @s remove vexp.door_closed
tag @s remove vexp.door_pending_close

scoreboard players operation #temp vexp.id = @s vexp.id

#Left
execute as @e[type=item_display,tag=vexp.custom_block.display,tag=!vexp.neighbour.right] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:2,transformation:{left_rotation:[0f,0.7071f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[-0.44f,0.475f,0.375f],scale:[1.005f,1.001f,1.001f]}}

#Right
execute as @e[type=item_display,tag=vexp.custom_block.display,tag=!vexp.neighbour.left] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:2,transformation:{left_rotation:[0f,0.7071f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0.44f,0.475f,0.44f],scale:[-1.005f,1.001f,-1.001f]}}

execute if entity @s[y_rotation=-45..45] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=true]
execute if entity @s[y_rotation=-45..45] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=true]
execute if entity @s[y_rotation=45..135] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=true]
execute if entity @s[y_rotation=45..135] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=true]
execute if entity @s[y_rotation=-135..-45] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=true]
execute if entity @s[y_rotation=-135..-45] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=true]
execute if entity @s[y_rotation=136..180] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=true]
execute if entity @s[y_rotation=136..180] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=true]
execute if entity @s[y_rotation=-180..-136] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=true]
execute if entity @s[y_rotation=-180..-136] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=true]
