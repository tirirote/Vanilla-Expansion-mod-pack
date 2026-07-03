# update_display_model.mcfunction
data remove storage vexp:custom_block door_model

execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_oak"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_oak_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_birch"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_birch_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_spruce"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_spruce_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_dark_oak"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_dark_oak_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_acacia"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_acacia_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_jungle"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_jungle_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_mangrove"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_mangrove_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_cherry"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_cherry_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_pale_oak"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_pale_oak_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_warped"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_warped_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_crimson"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_crimson_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_bamboo"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_bamboo_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_iron"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_iron_with_lock"
execute if data entity @s data.vexp{has_lock:1,model:"vexp:door_copper"} run data modify storage vexp:custom_block door_model.name set value "vexp:door_block_copper_with_lock"

scoreboard players operation #door_id vexp.id = @s vexp.id
function vexp:custom_block/blocks/door/update_display_model_macro with storage vexp:custom_block door_model
