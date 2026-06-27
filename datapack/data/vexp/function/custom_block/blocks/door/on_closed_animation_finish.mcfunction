# on_closed_animation_finish.mcfunction
# Se ejecuta cuando termina la animación de cierre
# Procesa puertas pendientes y coloca trapdoor con facing según orientación

# Colocar puerta orientada (parte inferior y superior)
# Mapeo unificado: 0=South, 90=West, -90=East, 180=North

execute if entity @s[y_rotation=-45..45,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=-45..45,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=false,hinge=right]
execute if entity @s[y_rotation=-45..45,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=-45..45,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=false,hinge=left]

execute if entity @s[y_rotation=45..135,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=45..135,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=false,hinge=right]
execute if entity @s[y_rotation=45..135,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=45..135,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=false,hinge=left]

execute if entity @s[y_rotation=-135..-45,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=-135..-45,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=false,hinge=right]
execute if entity @s[y_rotation=-135..-45,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=-135..-45,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=false,hinge=right]

execute if entity @s[y_rotation=136..180,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=136..180,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=right]
execute if entity @s[y_rotation=136..180,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=136..180,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=left]

execute if entity @s[y_rotation=-180..-136,tag=!vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=right]
execute if entity @s[y_rotation=-180..-136,tag=!vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=right]
execute if entity @s[y_rotation=-180..-136,tag=vexp.neighbour.right] run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false,hinge=left]
execute if entity @s[y_rotation=-180..-136,tag=vexp.neighbour.right] run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false,hinge=left]

# Limpiar estado pendiente
tag @s remove vexp.door_pending_close
