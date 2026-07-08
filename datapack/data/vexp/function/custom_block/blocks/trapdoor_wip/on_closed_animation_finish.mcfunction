# on_closed_animation_finish.mcfunction
# Se ejecuta cuando termina la animación de cierre.

function vexp:custom_block/blocks/trapdoor/apply_block_state
tag @s remove vexp.trapdoor_pending_close
