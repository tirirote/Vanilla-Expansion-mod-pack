# update_indicator_coords.mcfunction
# Se ejecuta en el contexto del jugador
# Calcula las coordenadas relativas y muestra la actionbar del waypoint actual

# Obtener posición del jugador
execute store result score @s vexp.player_x run data get entity @s Pos[0] 1
execute store result score @s vexp.player_y run data get entity @s Pos[1] 1
execute store result score @s vexp.player_z run data get entity @s Pos[2] 1

# Obtener posición del waypoint desde storage
execute store result score @s vexp.waypoint_x run data get storage vexp:waypoint display.pos[0] 1
execute store result score @s vexp.waypoint_y run data get storage vexp:waypoint display.pos[1] 1
execute store result score @s vexp.waypoint_z run data get storage vexp:waypoint display.pos[2] 1

# Calcular diferencias de coordenadas
scoreboard players operation @s vexp.diff_x = @s vexp.waypoint_x
scoreboard players operation @s vexp.diff_x -= @s vexp.player_x

scoreboard players operation @s vexp.diff_y = @s vexp.waypoint_y
scoreboard players operation @s vexp.diff_y -= @s vexp.player_y

scoreboard players operation @s vexp.diff_z = @s vexp.waypoint_z
scoreboard players operation @s vexp.diff_z -= @s vexp.player_z

# Distancia real en bloques: sqrt(dx^2 + dy^2 + dz^2)
scoreboard players operation #ax vexp.math = @s vexp.diff_x
scoreboard players operation #ay vexp.math = @s vexp.diff_y
scoreboard players operation #az vexp.math = @s vexp.diff_z
execute if score #ax vexp.math matches ..-1 run scoreboard players operation #ax vexp.math *= #neg_one vexp.math
execute if score #ay vexp.math matches ..-1 run scoreboard players operation #ay vexp.math *= #neg_one vexp.math
execute if score #az vexp.math matches ..-1 run scoreboard players operation #az vexp.math *= #neg_one vexp.math

scoreboard players operation #x2 vexp.math = #ax vexp.math
scoreboard players operation #y2 vexp.math = #ay vexp.math
scoreboard players operation #z2 vexp.math = #az vexp.math
scoreboard players operation #x2 vexp.math *= #ax vexp.math
scoreboard players operation #y2 vexp.math *= #ay vexp.math
scoreboard players operation #z2 vexp.math *= #az vexp.math
scoreboard players operation #len2 vexp.math = #x2 vexp.math
scoreboard players operation #len2 vexp.math += #y2 vexp.math
scoreboard players operation #len2 vexp.math += #z2 vexp.math

scoreboard players set #two vexp.math 2
scoreboard players operation #len vexp.math = #ax vexp.math
execute if score #ay vexp.math > #len vexp.math run scoreboard players operation #len vexp.math = #ay vexp.math
execute if score #az vexp.math > #len vexp.math run scoreboard players operation #len vexp.math = #az vexp.math
execute if score #len vexp.math matches 0 run scoreboard players set #len vexp.math 1

scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math
scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math
scoreboard players operation #tmp vexp.math = #len2 vexp.math
scoreboard players operation #tmp vexp.math /= #len vexp.math
scoreboard players operation #len vexp.math += #tmp vexp.math
scoreboard players operation #len vexp.math /= #two vexp.math

scoreboard players operation @s vexp.waypoint_dist = #len vexp.math

# Mostrar actionbar simplificado: nombre + distancia
title @s actionbar [{"nbt":"display.name","storage":"vexp:waypoint","interpret":true},{"text":" ( ","color":"gray"},{"score":{"name":"@s","objective":"vexp.waypoint_dist"},"color":"gray"},{"text":" m )","color":"gray"}]

