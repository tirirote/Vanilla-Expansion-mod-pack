# install_lock.mcfunction

data modify entity @s data.vexp.has_lock set value 1
data modify entity @s data.vexp.key_name set value ""

function vexp:custom_block/blocks/door/update_display_model

# Eliminar 1 count del candado al instalarlo
item modify entity @a[tag=vexp.door_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}

# Feedback
function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_trapdoor.close"}
execute positioned ~ ~1 ~ run particle composter ^ ^ ^-0.5 0.2 0.2 0.2 1 3

tag @s add vexp.lock_install_success
