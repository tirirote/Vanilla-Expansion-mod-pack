# on_break.mcfunction

execute if data entity @s data.vexp{target_type:"container"} unless data entity @s data.vexp{key_name:""} run function vexp:custom_block/blocks/lock/clear_container_lock
