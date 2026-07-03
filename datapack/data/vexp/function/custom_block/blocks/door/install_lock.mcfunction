# install_lock.mcfunction

data modify entity @s data.vexp.has_lock set value 1
data modify entity @s data.vexp.key_name set value ""

function vexp:custom_block/blocks/door/update_display_model

# Consumir una vela de la mano del jugador
item modify entity @a[tag=vexp.door_user,limit=1] weapon.mainhand {"function":"minecraft:set_count","count":-1,"add":true}
function vexp:custom_block/macro/sound {sound:"minecraft:block.iron_trapdoor.close"}

tag @s add vexp.lock_install_success
