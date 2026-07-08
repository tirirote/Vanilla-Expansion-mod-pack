# place_closed_trapdoor_block.mcfunction
# Colocar trapdoor cerrada usando el estado persistente.

data modify entity @s data.vexp.trap_open set value 0b
function vexp:custom_block/blocks/trapdoor/apply_block_state
