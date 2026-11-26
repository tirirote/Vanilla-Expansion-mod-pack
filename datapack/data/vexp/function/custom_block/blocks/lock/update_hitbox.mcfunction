# AS el candado, con vexp.lock_has_key ya evaluado.
execute if data entity @s data.vexp{key_name:""} run return 0

execute if entity @s[tag=vexp.lock_has_key,tag=vexp.lock_expanded] run function vexp:custom_block/blocks/lock/shrink_hitbox
execute unless entity @s[tag=vexp.lock_has_key] unless entity @s[tag=vexp.lock_expanded] run function vexp:custom_block/blocks/lock/expand_hitbox
