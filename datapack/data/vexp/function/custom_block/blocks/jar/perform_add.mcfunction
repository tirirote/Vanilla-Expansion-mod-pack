# perform_add.mcfunction
# Se ejecuta AS la interaction

# 1. Incrementar el contador persistente
execute store result score #prev vexp.math run data get entity @s data.vexp.item_count
scoreboard players operation #temp vexp.math = #prev vexp.math
scoreboard players add #temp vexp.math 1
execute store result entity @s data.vexp.item_count int 1 run scoreboard players get #temp vexp.math

# 2. Si estaba vacío, registrar el tipo base del contenido
execute if score #prev vexp.math matches 0 run function vexp:custom_block/blocks/jar/set_content_from_held

# 3. Actualizar estado de llenado + modelo del bloque
function vexp:custom_block/blocks/jar/update_fill_state
function vexp:custom_block/blocks/jar/update_display_model

# 4. Descontar del jugador
item modify entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand { "function": "minecraft:set_count", "count": -1, "add": true }

# 5. Feedback
function vexp:custom_block/macro/sound {sound:"minecraft:block.sand.place"}
function vexp:custom_block/macro/sound {sound:"minecraft:entity.armadillo.scute_drop"}
particle composter ~ ~0.5 ~ 0.2 0.2 0.2 .1 1
