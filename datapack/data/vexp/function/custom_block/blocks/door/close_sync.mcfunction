# close_sync.mcfunction
# Igual que close, pero sin sonido para sincronizacion de puerta doble

# Marcar estado cerrado
tag @s remove vexp.door_opened
tag @s add vexp.door_pending_close

scoreboard players operation #temp vexp.id = @s vexp.id

# Tag Left Door
tag @e[type=interaction,tag=vexp.neighbour.left,sort=nearest,limit=1] add vexp.close_door_anim
scoreboard players set @e[type=interaction,tag=vexp.neighbour.left,sort=nearest,limit=1] vexp.block_anim 10

# Agendar colocación de trapdoor cuando termine la animación (6 ticks)
function vexp:custom_block/blocks/door/on_closed_animation_finish
