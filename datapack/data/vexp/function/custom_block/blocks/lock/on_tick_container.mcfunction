# Lock tick for chests
tag @s remove vexp.lock_has_key
tag @s add vexp.lock_checking

# Check player key for hitbox dynamic size
execute unless data entity @s data.vexp{key_name:""} run function vexp:custom_block/blocks/lock/check_player_key_macro with entity @s data.vexp
function vexp:custom_block/blocks/lock/update_hitbox

# Break lock if missing block
execute unless block ^ ^ ^0.25 #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp
tag @s remove vexp.lock_checking
