# Vaciar el jar completo cuando el jugador interactua con mano vacia

# 1. Preparar datos y soltar cada item individualmente con motion aleatorio
execute if data entity @s data.vexp.jar_item_id run data modify storage vexp:custom_block jar_drop.id set from entity @s data.vexp.jar_item_id
execute if data entity @s data.vexp.jar_item_id if data entity @s data.vexp.item_count store result score #count vexp.math run data get entity @s data.vexp.item_count
execute if data entity @s data.vexp.jar_item_id if score #count vexp.math matches 1.. at @s run function vexp:custom_block/blocks/jar/empty_all_loop

# 2. Compat legacy: si hay visuals antiguos, soltarlos todos
scoreboard players operation #temp vexp.id = @s vexp.id
execute unless data entity @s data.vexp.jar_item_id as @e[type=item_display,tag=vexp.jar.inventory,sort=nearest,distance=..1] if score @s vexp.id = #temp vexp.id at @s run function vexp:custom_block/blocks/jar/drop_item_logic
execute as @e[type=item_display,tag=vexp.jar.inventory,sort=nearest,distance=..1] if score @s vexp.id = #temp vexp.id run kill @s

# 3. Limpiar estado persistido del jar
data modify entity @s data.vexp.item_count set value 0
data remove entity @s data.vexp.jar_item_id
data remove entity @s data.vexp.jar_content
data remove entity @s data.vexp.jar_fill_state

# 4. Volver al modelo vacio del jar
scoreboard players operation #jar_id vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.custom_block.display,sort=nearest,distance=..1.5] if score @s vexp.id = #jar_id vexp.id run data modify entity @s item.components."minecraft:custom_model_data".strings set value ["vexp:jar"]

# 5. Sonido feedback de recogida
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}
