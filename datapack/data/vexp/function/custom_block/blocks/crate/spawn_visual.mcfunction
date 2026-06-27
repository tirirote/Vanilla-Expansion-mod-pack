# Macro para spawnear un item_display dentro de la crate
# Input: $(x), $(y), $(z), $(item), $(id)

$summon item_display ~ ~ ~ {Tags:["vexp.crate.inventory","vexp.crate.new","vexp.inventory_visual"],item:$(item),transformation:{translation:[$(x),$(y),$(z)],scale:[0.75f,0.75f,0.75f],left_rotation:[1f,0f,0f,1f],right_rotation:[0f,0f,0f,1f]},teleport_duration:1,interpolation_duration:2}
$execute as @e[type=item_display,tag=vexp.crate.new,sort=nearest,limit=1,distance=..1] run scoreboard players set @s vexp.id $(id)

function vexp:utils/get_random_128

execute as @e[type=item_display,tag=vexp.crate.new,sort=nearest,limit=1,distance=..1] store result entity @s Rotation[0] float 1 run scoreboard players get #random vexp.id
tag @e[type=item_display,tag=vexp.crate.new] remove vexp.crate.new
