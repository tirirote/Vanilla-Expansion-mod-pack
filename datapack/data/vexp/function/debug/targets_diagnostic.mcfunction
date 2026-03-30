# vexp:debug/targets_diagnostic
# Ejecutar como jugador: /function vexp:debug/targets_diagnostic
# Diagnostica coincidencias de objetivos en 64 bloques.

# Limpieza de tags temporales
 tag @e[tag=vexp.diag.target_type] remove vexp.diag.target_type
 tag @e[tag=vexp.diag.target_pred] remove vexp.diag.target_pred

# Reset de resultados
scoreboard players set #diag_type vexp.math 0
scoreboard players set #diag_pred vexp.math 0
scoreboard players set #diag_delta vexp.math 0

# Conteo por tag de tipo (type=#vexp:targets)
execute at @s store result score #diag_type vexp.math run tag @e[type=#vexp:targets,distance=..64] add vexp.diag.target_type

# Conteo por predicado (predicate=vexp:is_target)
execute at @s store result score #diag_pred vexp.math run tag @e[predicate=vexp:is_target,distance=..64] add vexp.diag.target_pred

# Delta = type_count - predicate_count
scoreboard players operation #diag_delta vexp.math = #diag_type vexp.math
scoreboard players operation #diag_delta vexp.math -= #diag_pred vexp.math

tellraw @s [{"text":"[VEXP DEBUG] targets en radio 64 -> ","color":"gold"},{"text":"type=#vexp:targets=","color":"yellow"},{"score":{"name":"#diag_type","objective":"vexp.math"},"color":"white"},{"text":" | predicate=vexp:is_target=","color":"aqua"},{"score":{"name":"#diag_pred","objective":"vexp.math"},"color":"white"}]

execute if entity @e[type=minecraft:zombie,distance=..64] run tellraw @s {"text":"[VEXP DEBUG] control zombie directo: SI (hay al menos 1)","color":"light_purple"}
execute unless entity @e[type=minecraft:zombie,distance=..64] run tellraw @s {"text":"[VEXP DEBUG] control zombie directo: NO (puede no haber mobs cerca)","color":"dark_gray"}

execute if score #diag_delta vexp.math matches 0 run tellraw @s {"text":"[VEXP DEBUG] OK: type y predicate coinciden.","color":"green"}
execute unless score #diag_delta vexp.math matches 0 run tellraw @s [{"text":"[VEXP DEBUG] MISMATCH detectado. Delta(type-predicate)=","color":"red"},{"score":{"name":"#diag_delta","objective":"vexp.math"},"color":"white"}]

# Si hay entidades por type y no por predicate, el predicado no esta cargando.
execute if score #diag_type vexp.math matches 1.. unless score #diag_pred vexp.math matches 1.. run tellraw @s {"text":"[VEXP DEBUG] type encuentra objetivos, predicate no. Revisar vexp:is_target.","color":"red"}

# Si no hay entidades por ninguno, probablemente no hay mobs en rango o no se cargo la tag.
execute unless score #diag_type vexp.math matches 1.. unless score #diag_pred vexp.math matches 1.. run tellraw @s {"text":"[VEXP DEBUG] 0 objetivos por ambos metodos. Acercate a mobs y vuelve a ejecutar.","color":"gray"}

# Mostrar una entidad detectada por cada metodo (si existe)
execute at @s if entity @e[tag=vexp.diag.target_type,distance=..64,limit=1,sort=nearest] run tellraw @s [{"text":"[VEXP DEBUG] ejemplo(type): ","color":"yellow"},{"selector":"@e[tag=vexp.diag.target_type,distance=..64,limit=1,sort=nearest]","color":"white"}]
execute at @s if entity @e[tag=vexp.diag.target_pred,distance=..64,limit=1,sort=nearest] run tellraw @s [{"text":"[VEXP DEBUG] ejemplo(predicate): ","color":"aqua"},{"selector":"@e[tag=vexp.diag.target_pred,distance=..64,limit=1,sort=nearest]","color":"white"}]

# Limpieza final
 tag @e[tag=vexp.diag.target_type] remove vexp.diag.target_type
 tag @e[tag=vexp.diag.target_pred] remove vexp.diag.target_pred
