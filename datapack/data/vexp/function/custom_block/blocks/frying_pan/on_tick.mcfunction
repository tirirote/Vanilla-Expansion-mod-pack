# Se ejecuta AS la interaction de la sarten

# Si no hay item dentro, reiniciamos el timer
execute unless data entity @s data.vexp.pan_item run data modify entity @s data.vexp.cook_time set value 0

# Solo cocinamos si hay una fuente de calor compatible debajo
execute if data entity @s data.vexp.pan_item at @s if block ~ ~-1 ~ #vexp:frying_pan_heat_sources_lit[lit=true] run function vexp:custom_block/blocks/frying_pan/try_cook
execute if data entity @s data.vexp.pan_item at @s if block ~ ~-1 ~ #vexp:frying_pan_heat_sources run function vexp:custom_block/blocks/frying_pan/try_cook

# Si no hay fuente de calor, se enfria el progreso
execute if data entity @s data.vexp.pan_item at @s unless block ~ ~-1 ~ #vexp:frying_pan_heat_sources_lit[lit=true] unless block ~ ~-1 ~ #vexp:frying_pan_heat_sources run data modify entity @s data.vexp.cook_time set value 0
