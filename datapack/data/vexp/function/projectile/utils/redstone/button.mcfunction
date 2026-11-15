$execute unless block ~ ~ ~ $(block)[powered=false] run return 0
data modify storage vexp:projectile redstone set value {kind:"button",face:"wall",facing:"north",duration:30}
$data modify storage vexp:projectile redstone.block set value "$(block)"
$execute if block ~ ~ ~ $(block)[face=floor] run data modify storage vexp:projectile redstone.face set value "floor"
$execute if block ~ ~ ~ $(block)[face=ceiling] run data modify storage vexp:projectile redstone.face set value "ceiling"
$execute if block ~ ~ ~ $(block)[facing=east] run data modify storage vexp:projectile redstone.facing set value "east"
$execute if block ~ ~ ~ $(block)[facing=south] run data modify storage vexp:projectile redstone.facing set value "south"
$execute if block ~ ~ ~ $(block)[facing=west] run data modify storage vexp:projectile redstone.facing set value "west"
function vexp:projectile/utils/redstone/button_on with storage vexp:projectile redstone
function vexp:projectile/utils/redstone/button_off with storage vexp:projectile redstone
