# on_tick.mcfunction
# Ejecutar AS la interaction del candado.

tag @s remove vexp.prevent_break

# When lock mounted on container
execute if data entity @s data.vexp{target_type:"container"} run function vexp:custom_block/blocks/lock/on_tick_container

# When lock mounted on door
execute if data entity @s data.vexp{target_type:"door"} run function vexp:custom_block/blocks/lock/on_tick_door

execute unless entity @s[tag=vexp.lock_has_key] run tag @s add vexp.prevent_break
