# interact.mcfunction
# Se ejecuta AS la interaction del jarrón (vexp.custom_block.interact)

# 1. Identificar al jugador que interactúa
execute on target run tag @s add vexp.jar_user

# 2. Decidir acción: Meter Ítem
# Mantenemos @s como el jarrón para que guarde los datos correctamente
function vexp:custom_block/blocks/jar/add_item

# Limpieza
tag @p[tag=vexp.jar_user,limit=1] remove vexp.jar_user