# on_break.mcfunction
# Ejecutar AS la interaction de la puerta

# Remover tag de cerrado
tag @s remove vexp.door_closed
tag @s remove vexp.door_pending_close

# Limpieza defensiva de puerta fisica
execute if block ~ ~ ~ iron_door run setblock ~ ~ ~ air strict
execute if block ~ ~1 ~ iron_door run setblock ~ ~1 ~ air strict

# Si la puerta tiene un candado, dropea el candado al romperse
execute unless entity @s[tag=vexp.neighbour.right] if data entity @s data.vexp{has_lock:1} run summon item ~ ~ ~ {Item:{id:"item_frame",count:1,components:{"minecraft:entity_data":{"id":"minecraft:item_frame","Tags":["vexp.custom_block.place"],"data":{"vexp":{"id":"lock","model":"vexp:lock","width":0.65,"height":0.75,"type":"lock","name":"Candado","s_place":"minecraft:block.chain.place","s_break":"minecraft:block.chain.break","p_break":"minecraft:block{block_state:{Name:'minecraft:iron_chain'}}","scale":1,"y":0.15,"placeable_anywhere":1b,"key_name":"","target_type":"none","target_offset":"self","door_id":0}},"Invisible":true,"Fixed":true,"Silent":true},"minecraft:custom_model_data":{"strings":["vexp:lock"]},"minecraft:item_name":{"text":"Candado","italic":false}}}}
