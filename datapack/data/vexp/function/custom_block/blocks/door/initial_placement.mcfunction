#Initial Placement

#Update doors display
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display,distance=..2] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:0,transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[-0.435f,0.47f,-0.4375f],scale:[1f,1f,1f]}}

#Place Iron Door
execute if entity @s[y_rotation=-45..45,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=-45..45,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=false,hinge=left]
execute if entity @s[y_rotation=-45..45,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=-45..45,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=false,hinge=right]

execute if entity @s[y_rotation=45..135,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=45..135,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=false,hinge=left]
execute if entity @s[y_rotation=45..135,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=45..135,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=false,hinge=right]

execute if entity @s[y_rotation=-135..-45,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=-135..-45,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=false,hinge=left]
execute if entity @s[y_rotation=-135..-45,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=-135..-45,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=false,hinge=right]

execute if entity @s[y_rotation=136..180,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=136..180,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=left]
execute if entity @s[y_rotation=136..180,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=136..180,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=right]

execute if entity @s[y_rotation=-180..-136,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=-180..-136,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=left]
execute if entity @s[y_rotation=-180..-136,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=-180..-136,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=right]
