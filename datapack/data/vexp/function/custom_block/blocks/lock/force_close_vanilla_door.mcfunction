# Fuerza cierre de puerta vanilla respetando tipo, facing y hinge.
# Se ejecuta POSICIONADO sobre un bloque de puerta (idealmente lower).

# Feedback
execute if block ~ ~ ~ #minecraft:doors[open=true] run title @a[distance=..6] actionbar [{"text":"¡Está cerrada!","color":"white","italic":false}]

function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:oak_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:spruce_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:birch_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:jungle_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:acacia_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:dark_oak_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:mangrove_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:cherry_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:bamboo_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:crimson_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:warped_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:pale_oak_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:iron_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:waxed_copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:exposed_copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:oxidized_copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:weathered_copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:waxed_exposed_copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:waxed_oxidized_copper_door"}
function vexp:custom_block/blocks/lock/force_close_vanilla_door_type {door:"minecraft:waxed_weathered_copper_door"}
