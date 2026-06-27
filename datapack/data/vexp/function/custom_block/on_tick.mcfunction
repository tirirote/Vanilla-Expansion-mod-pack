# 1. Despachar al hook on_tick específico del bloque
function vexp:custom_block/macro/dispatch_tick with entity @s data.vexp

# 5. Jitter feedback
execute if entity @s[tag=vexp.block.jitter] if score @s vexp.block_anim matches 1.. run function vexp:custom_block/jitter
