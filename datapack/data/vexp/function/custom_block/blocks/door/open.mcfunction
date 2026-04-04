# open.mcfunction
# Ejecutar AS la interaction de la puerta

# Marcar estado abierto y remover tag de cerrado
data merge entity @s {data:{vexp:{door_open:1b}}}
tag @s remove vexp.door_closed
tag @s remove vexp.door_pending_close

# Capturar ID para encontrar el display vinculado
scoreboard players operation #temp vexp.id = @s vexp.id

# Animacion suave: giro local abierto (pivot ajustado)
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:2,transformation:{left_rotation:[0f,-0.7071f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[-0.44f,0.475f,0.375f],scale:[1.005f,1.001f,1.001f]}}

# Quitar puerta fisica al abrir inmediatamente
execute if block ~ ~ ~ iron_door run setblock ~ ~ ~ air

# Sonido de apertura
function vexp:custom_block/macro/sound {sound:"minecraft:block.wooden_door.close"}
