# open.mcfunction
# Ejecutar AS la interaction de la puerta

stopsound @a[distance=..10] * block.iron_door.open
stopsound @a[distance=..10] * block.iron_door.close

# Marcar estado abierto y remover tag de cerrado
tag @s add vexp.door_opened
tag @s remove vexp.door_pending_close

# Capturar ID para encontrar el display vinculado
scoreboard players operation #temp vexp.id = @s vexp.id

# Animacion suave: giro local abierto (pivot ajustado)
tag @s add vexp.open_door_anim
scoreboard players set @s vexp.block_anim 10

# Mantener hitbox como puerta de hierro abierta para detectar redstone
# Mapeo unificado: 0=South, 90=West, -90=East, 180=North
# Se añade hinge=right si es la puerta derecha de un par para evitar solapamiento

execute if entity @s[y_rotation=-45..45,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=-45..45,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=-45..45,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=true,hinge=right]
execute if entity @s[y_rotation=-45..45,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=true,hinge=right]

execute if entity @s[y_rotation=45..135,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=45..135,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=45..135,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=true,hinge=right]
execute if entity @s[y_rotation=45..135,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=true,hinge=right]

execute if entity @s[y_rotation=-135..-45,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=-135..-45,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=-135..-45,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=true,hinge=right]
execute if entity @s[y_rotation=-135..-45,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=true,hinge=right]

execute if entity @s[y_rotation=136..180,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=136..180,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=136..180,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=true,hinge=right]
execute if entity @s[y_rotation=136..180,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=true,hinge=right]

execute if entity @s[y_rotation=-180..-136,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=true,hinge=left]
execute if entity @s[y_rotation=-180..-136,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=true,hinge=left]

execute if entity @s[y_rotation=-180..-136,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=true,hinge=right]
execute if entity @s[y_rotation=-180..-136,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=true,hinge=right]
