# init_right_model.mcfunction
# Ejecutar AS la interaction de la puerta derecha
# Inicializa una sola vez el modelo espejado para evitar glitch de primera interpolacion

scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id run data merge entity @s {start_interpolation:0,interpolation_duration:0,transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0.4375f,0.47f,-0.375f],scale:[-1f,1f,-1f]}}
tag @s add vexp.right_model_initialized
