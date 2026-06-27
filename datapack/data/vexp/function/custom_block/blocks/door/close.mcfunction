# close.mcfunction
# Ejecutar AS la interaction de la puerta

stopsound @a[distance=..10] * block.iron_door.open
stopsound @a[distance=..10] * block.iron_door.close

# Marcar estado cerrado
tag @s remove vexp.door_opened
tag @s add vexp.door_pending_close

# Capturar ID para encontrar el display vinculado
scoreboard players operation #temp vexp.id = @s vexp.id

# Animación suave: activar tag y contador
tag @s add vexp.close_door_anim
scoreboard players set @s vexp.block_anim 10

# Agendar colocación de la hitbox cerrada cuando termine la animación (10 ticks)
function vexp:custom_block/blocks/door/on_closed_animation_finish

