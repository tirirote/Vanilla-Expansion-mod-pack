# on_closed_animation_finish.mcfunction
# Se ejecuta cuando termina la animación de cierre
# Procesa puertas pendientes y coloca trapdoor con facing según orientación

# Marcar como cerrada solo si sigue cerrada al finalizar la animación
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,nbt={data:{vexp:{type:"door",door_open:0b}}}] run tag @s add vexp.door_closed

# Colocar puerta orientada (parte inferior y superior)
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=-45..45] at @s run setblock ~ ~ ~ iron_door[facing=north,half=lower,open=false]
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=-45..45] at @s run setblock ~ ~1 ~ iron_door[facing=north,half=upper,open=false]

execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=45..135] at @s run setblock ~ ~ ~ iron_door[facing=east,half=lower,open=false]
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=45..135] at @s run setblock ~ ~1 ~ iron_door[facing=east,half=upper,open=false]

execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=-135..-45] at @s run setblock ~ ~ ~ iron_door[facing=west,half=lower,open=false]
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=-135..-45] at @s run setblock ~ ~1 ~ iron_door[facing=west,half=upper,open=false]

execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=136..180] at @s run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=false]
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=136..180] at @s run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=false]

execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=-180..-136] at @s run setblock ~ ~ ~ iron_door[facing=south,half=lower,open=false]
execute as @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close,tag=vexp.door_closed,y_rotation=-180..-136] at @s run setblock ~ ~1 ~ iron_door[facing=south,half=upper,open=false]

# Limpiar estado pendiente
tag @e[type=interaction,tag=vexp.custom_block.interact,tag=vexp.door_pending_close] remove vexp.door_pending_close
