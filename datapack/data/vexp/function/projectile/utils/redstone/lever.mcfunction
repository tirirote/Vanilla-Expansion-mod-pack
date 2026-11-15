data modify storage vexp:projectile redstone set value {face:"wall",facing:"north",powered:"true"}
execute if block ~ ~ ~ minecraft:lever[face=floor] run data modify storage vexp:projectile redstone.face set value "floor"
execute if block ~ ~ ~ minecraft:lever[face=ceiling] run data modify storage vexp:projectile redstone.face set value "ceiling"
execute if block ~ ~ ~ minecraft:lever[facing=east] run data modify storage vexp:projectile redstone.facing set value "east"
execute if block ~ ~ ~ minecraft:lever[facing=south] run data modify storage vexp:projectile redstone.facing set value "south"
execute if block ~ ~ ~ minecraft:lever[facing=west] run data modify storage vexp:projectile redstone.facing set value "west"
execute if block ~ ~ ~ minecraft:lever[powered=true] run data modify storage vexp:projectile redstone.powered set value "false"
function vexp:projectile/utils/redstone/lever_set with storage vexp:projectile redstone
