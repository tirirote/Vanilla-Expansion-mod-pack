# on_closed_animation_finish.mcfunction
# Se ejecuta cuando termina la animación de cierre
# Procesa puertas pendientes y coloca trapdoor con facing según orientación

# Colocar puerta orientada (parte inferior y superior)
function vexp:custom_block/blocks/door/place_closed_door_block

# Limpiar estado pendiente
tag @s remove vexp.door_pending_close
