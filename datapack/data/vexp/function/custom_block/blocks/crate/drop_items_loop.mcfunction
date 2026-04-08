# Loop recursivo: droppea los items de crate_break.items hasta vaciarla
# Se ejecuta AT la posición de la interaction

execute unless data storage vexp:custom_block crate_break.items[0] run return 0

data modify storage vexp:custom_block crate_break.current set from storage vexp:custom_block crate_break.items[0]
data remove storage vexp:custom_block crate_break.items[0]

function vexp:custom_block/blocks/crate/drop_single_item with storage vexp:custom_block crate_break
function vexp:custom_block/blocks/crate/drop_items_loop
