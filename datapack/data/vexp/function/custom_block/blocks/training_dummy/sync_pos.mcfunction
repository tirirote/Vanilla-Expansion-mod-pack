# sync_pos.mcfunction
# Se ejecuta AS y AT la interaccion del training_dummy
scoreboard players operation #temp vexp.id = @s vexp.id

# 1. Mantenemos el slime sincroizado firmemente
execute as @e[type=slime,tag=vexp.custom_block.dummy] if score @s vexp.id = #temp vexp.id run tp @s ~ ~1 ~

# 2. Obtenemos el HurtTime del slime
execute as @e[type=slime,tag=vexp.custom_block.dummy] if score @s vexp.id = #temp vexp.id store result score #hurt vexp.math run data get entity @s HurtTime

# 3. Animación de Balanceo (Interpolación fluida basada en cuaterniones)
# Golazo hacia atrás (HurtTime 10) -> Pitch de ~20 grados
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id if score #hurt vexp.math matches 10 run data merge entity @s {start_interpolation:0, interpolation_duration:3, transformation:{left_rotation:[0f,1f,0.1736f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}

# Rebote hacia adelante (HurtTime 5) -> Pitch de ~-10 grados
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id if score #hurt vexp.math matches 5 run data merge entity @s {start_interpolation:0, interpolation_duration:4, transformation:{left_rotation:[0f,1f,-0.0871f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}

# Reposo original (HurtTime 1) -> Pitch 0
execute as @e[type=item_display,tag=vexp.custom_block.display] if score @s vexp.id = #temp vexp.id if score #hurt vexp.math matches 1 run data merge entity @s {start_interpolation:0, interpolation_duration:3, transformation:{left_rotation:[0f,1f,0f,0f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]}}
