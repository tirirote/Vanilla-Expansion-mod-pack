# on_interact.mcfunction
# Ejecutar AS la interaction de la puerta

execute unless entity @s[tag=vexp.neighbour.right] run function vexp:custom_block/blocks/door/try_install_lock

execute unless entity @s[tag=vexp.neighbour.right] unless entity @s[tag=vexp.lock_install_success] unless entity @s[tag=vexp.door_opened] run function vexp:custom_block/blocks/door/check_lock
execute unless entity @s[tag=vexp.neighbour.right] unless data entity @s data.vexp{model: "vexp:door_iron"} unless entity @s[tag=vexp.lock_install_success] unless entity @s[tag=vexp.lock_blocked] run function vexp:custom_block/blocks/door/on_interact_unlocked

execute unless entity @s[tag=vexp.neighbour.right] if data entity @s data.vexp{model: "vexp:door_iron"} unless entity @s[tag=vexp.lock_install_success] unless entity @s[tag=vexp.lock_blocked] run function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_door.close"}

tag @s remove vexp.lock_install_success
tag @s remove vexp.lock_blocked
