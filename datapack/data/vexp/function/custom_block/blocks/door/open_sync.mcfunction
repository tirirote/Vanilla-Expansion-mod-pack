# open_sync.mcfunction
# Igual que open, pero sin sonido para sincronizacion de puerta doble

# Marcar estado de abierto
tag @s add vexp.door_opened
tag @s remove vexp.door_pending_close

scoreboard players operation #temp vexp.id = @s vexp.id

# Tag Left Door
tag @e[type=interaction,tag=vexp.neighbour.left,tag=vexp.door_opened,sort=nearest,limit=1] add vexp.open_door_anim
scoreboard players set @e[type=interaction,tag=vexp.neighbour.left,tag=vexp.door_opened,sort=nearest,limit=1] vexp.block_anim 10

execute if entity @s[y_rotation=-45..45] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=-45..45] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=45..135] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=45..135] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=-135..-45] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=-135..-45] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=136..180] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=136..180] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=-180..-136] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=-180..-136] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=true,hinge=left]
