# close.mcfunction
# Ejecutar AS la interaction de la puerta

# Marcar estado cerrado
data merge entity @s {data:{vexp:{door_open:0b}}}
tag @s remove vexp.door_closed
tag @s add vexp.door_pending_close

# Capturar ID para encontrar el display vinculado
scoreboard players operation #temp vexp.id = @s vexp.id

# Animacion suave: giro local cerrado (pivot ajustado)
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:2,transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[-0.44f,0.475f,0.375f],scale:[1.005f,1.001f,1.001f]}}

# Agendar colocación de trapdoor cuando termine la animación (6 ticks)
schedule function vexp:custom_block/blocks/door/on_closed_animation_finish 4t append

# Sonido de cierre (leer desde NBT con macro)
function vexp:custom_block/macro/sound {sound:"minecraft:block.wooden_door.close"}
