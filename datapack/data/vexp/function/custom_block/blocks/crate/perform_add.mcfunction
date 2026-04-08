# Se ejecuta AS la interaction de la crate

# Guardar slot actual antes de incrementar (0..8)
execute store result score #slot vexp.id run data get entity @s data.vexp.item_count

# Incrementar contador persistente
scoreboard players operation #temp vexp.id = #slot vexp.id
scoreboard players add #temp vexp.id 1
execute store result entity @s data.vexp.item_count int 1 run scoreboard players get #temp vexp.id

# Descontar item del jugador
item modify entity @a[tag=vexp.crate_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}

# Preparar datos del visual
data modify storage vexp:custom_block crate.item set from storage vexp:custom_block item_held
data modify storage vexp:custom_block crate.item.count set value 1

# Persistir item en el NBT de la crate
data modify entity @s data.vexp.Items append from storage vexp:custom_block crate.item
execute store result storage vexp:custom_block crate.id int 1 run scoreboard players get @s vexp.id

# Posiciones de rejilla 3x3
execute if score #slot vexp.id matches 0 run data modify storage vexp:custom_block crate merge value {x:0.0f,y:0.05f,z:0.0f}
execute if score #slot vexp.id matches 1 run data modify storage vexp:custom_block crate merge value {x:0.1f,y:0.1f,z:0.1f}
execute if score #slot vexp.id matches 2 run data modify storage vexp:custom_block crate merge value {x:-0.1f,y:0.15f,z:0.0f}
execute if score #slot vexp.id matches 3 run data modify storage vexp:custom_block crate merge value {x:0.0f,y:0.2f,z:-0.1f}
execute if score #slot vexp.id matches 4 run data modify storage vexp:custom_block crate merge value {x:0.0f,y:0.25f,z:0.0f}
execute if score #slot vexp.id matches 5 run data modify storage vexp:custom_block crate merge value {x:-0.1f,y:0.3f,z:0.1f}
execute if score #slot vexp.id matches 6 run data modify storage vexp:custom_block crate merge value {x:-0.1f,y:0.35f,z:-0.1f}
execute if score #slot vexp.id matches 7 run data modify storage vexp:custom_block crate merge value {x:0.1f,y:0.4f,z:0f}
execute if score #slot vexp.id matches 8 run data modify storage vexp:custom_block crate merge value {x:0.0f,y:0.45f,z:0.1f}

function vexp:custom_block/blocks/crate/spawn_visual with storage vexp:custom_block crate

# Sonido
function vexp:custom_block/macro/sound {sound:"minecraft:entity.item.pickup"}
