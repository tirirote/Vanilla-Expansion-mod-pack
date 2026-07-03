# On spawn
# @s is the custom block interaction

# Default candle holder state
data modify entity @s data.vexp.candle_variant set value "none"
data modify entity @s data.vexp.candle_item set value ""
data modify entity @s data.vexp.candle_lit set value 0

# Ensure model starts in empty variant
function vexp:custom_block/blocks/candle_holder/update_display_model
