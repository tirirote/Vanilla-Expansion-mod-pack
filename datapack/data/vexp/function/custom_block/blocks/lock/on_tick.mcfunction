# on_tick.mcfunction
# Ejecutar AS la interaction del candado.

# When lock mounted on container
execute if data entity @s data.vexp{target_type:"container"} unless block ^ ^ ^1 #vexp:lock_containers run function vexp:custom_block/break with entity @s data.vexp

# When lock mounted on door
execute if data entity @s data.vexp{target_type:"door"} run function vexp:custom_block/blocks/lock/on_tick_door
