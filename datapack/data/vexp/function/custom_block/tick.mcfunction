# tick.mcfunction
# Se ejecuta cada tick desde vexp:tick

# 1. Buscar Item Frames con tag de colocación genérico
execute as @e[type=item_frame,tag=vexp.custom_block.place] at @s run function vexp:custom_block/process_placement

# 2. Gestionar Interacciones (Clic Derecho)
execute as @e[type=interaction,tag=vexp.custom_block.interact] at @s if data entity @s interaction run function vexp:custom_block/on_interact

# 3. Gestionar Ataques/Rotura (Clic Izquierdo)
execute as @e[type=interaction,tag=vexp.custom_block.interact] at @s if data entity @s attack run function vexp:custom_block/on_attack

# 4. Sincronizar Entidades (Ej. Training Dummy)
execute as @e[type=interaction,tag=vexp.custom_block.interact] at @s if data entity @s data.vexp{type:"training_dummy"} at @s run function vexp:custom_block/blocks/training_dummy/sync_pos
