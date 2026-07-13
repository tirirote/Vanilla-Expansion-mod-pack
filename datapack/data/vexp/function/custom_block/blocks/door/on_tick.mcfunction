# Ejecutar AS la interaction de la puerta
execute if entity @s[tag=vexp.open_door_anim] if score @s vexp.block_anim matches 1.. run function vexp:custom_block/blocks/door/open_anim
execute if entity @s[tag=vexp.close_door_anim] if score @s vexp.block_anim matches 1.. run function vexp:custom_block/blocks/door/close_anim
execute if entity @s[tag=vexp.locked_door_anim] if score @s vexp.block_anim matches 1.. run function vexp:custom_block/blocks/door/locked_anim

# Soporte redstone via estado open de la iron_door hitbox
execute unless block ~ ~ ~ #replaceable run function vexp:custom_block/blocks/door/redstone_tick

# Oxidación de puertas de cobre
execute if data entity @s data.vexp{model: "vexp:door_weathered_copper"} if predicate vexp:check_oxidation unless entity @s[tag=vexp.door_copper_prevent_oxidation] run function vexp:custom_block/blocks/door/copper_door_oxidize
execute if data entity @s data.vexp{model: "vexp:door_exposed_copper"} if predicate vexp:check_oxidation unless entity @s[tag=vexp.door_copper_prevent_oxidation] run function vexp:custom_block/blocks/door/copper_door_oxidize
execute if data entity @s data.vexp{model: "vexp:door_copper"} if predicate vexp:check_oxidation unless entity @s[tag=vexp.door_copper_prevent_oxidation] run function vexp:custom_block/blocks/door/copper_door_oxidize

# Soporte para windcharges
execute unless entity @s[tag=vexp.neighbour.right] unless data entity @s data.vexp{model: "vexp:door_iron"} unless entity @s[tag=vexp.lock_install_success] unless entity @s[tag=vexp.lock_blocked] if entity @e[type=wind_charge,distance=1..2,limit=1] run function vexp:custom_block/blocks/door/on_interact_unlocked

# Si no hay bloque de soporte, la puerta custom se rompe y limpia el drop de hitbox.
execute if block ~ ~ ~ #replaceable run kill @e[type=item,distance=..1.5,nbt={Item:{id:"minecraft:iron_door"}}]
execute if block ~ ~ ~ #replaceable run function vexp:custom_block/break with entity @s data.vexp
