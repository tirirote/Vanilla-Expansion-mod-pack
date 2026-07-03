# on_interact.mcfunction
# Ejecutar AS la interaction de la puerta

execute unless entity @s[tag=vexp.neighbour.right] run function vexp:custom_block/blocks/door/try_install_lock

execute unless entity @s[tag=vexp.neighbour.right] unless entity @s[tag=vexp.lock_install_success] unless entity @s[tag=vexp.door_opened] run function vexp:custom_block/blocks/door/check_lock
execute unless entity @s[tag=vexp.neighbour.right] unless entity @s[tag=vexp.lock_install_success] unless entity @s[tag=vexp.lock_blocked] run function vexp:custom_block/blocks/door/on_interact_unlocked

tag @s remove vexp.lock_install_success
tag @s remove vexp.lock_blocked
