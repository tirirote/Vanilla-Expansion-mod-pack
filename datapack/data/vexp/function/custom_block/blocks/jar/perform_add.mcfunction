# perform_add.mcfunction
# Se ejecuta AS la interaction

# 1. Incrementar el contador
execute store result score #temp vexp.id run data get entity @s data.vexp.item_count
scoreboard players add #temp vexp.id 1
execute store result entity @s data.vexp.item_count int 1 run scoreboard players get #temp vexp.id

# 2. Descontar del jugador
item modify entity @p[tag=vexp.jar_user,limit=1] weapon.mainhand { "function": "minecraft:set_count", "count": -1, "add": true }

# 3. Preparar macro para visual
# Y = (count-1) * 0.01 + 0.05
# Usamos #temp que tiene el nuevo count
scoreboard players remove #temp vexp.id 1
execute store result storage vexp:custom_block jar.y double 0.0125 run scoreboard players add #temp vexp.id 1

# Pasamos datos completos (para soportar cualquier item con su NBT/Componentes)
data modify storage vexp:custom_block jar.item set from storage vexp:custom_block item_held
# Nos aseguramos de que el visual tenga count 1
data modify storage vexp:custom_block jar.item.count set value 1
execute store result storage vexp:custom_block jar.id int 1 run scoreboard players get @s vexp.id

function vexp:custom_block/blocks/jar/spawn_visual with storage vexp:custom_block jar

# 4. Sonido
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}