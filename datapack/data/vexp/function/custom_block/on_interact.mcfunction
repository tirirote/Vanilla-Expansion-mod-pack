# 1. Limpiar data de interacción
data remove entity @s interaction

# 2. Despachar a la lógica específica del ítem (e.g. vexp:chair/interact)
# Usando macro basado en el 'type' del bloque guardado en 'vexp.type'
function vexp:custom_block/macro/dispatch_interact with entity @s data.vexp