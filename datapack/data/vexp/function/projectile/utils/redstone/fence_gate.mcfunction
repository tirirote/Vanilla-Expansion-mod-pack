data modify storage vexp:projectile redstone set value {facing:"north",in_wall:"false",open:"true",powered:"false"}
$data modify storage vexp:projectile redstone.block set value "$(block)"
$execute if block ~ ~ ~ $(block)[facing=east] run data modify storage vexp:projectile redstone.facing set value "east"
$execute if block ~ ~ ~ $(block)[facing=south] run data modify storage vexp:projectile redstone.facing set value "south"
$execute if block ~ ~ ~ $(block)[facing=west] run data modify storage vexp:projectile redstone.facing set value "west"
$execute if block ~ ~ ~ $(block)[in_wall=true] run data modify storage vexp:projectile redstone.in_wall set value "true"
$execute if block ~ ~ ~ $(block)[open=true] run data modify storage vexp:projectile redstone.open set value "false"
$execute if block ~ ~ ~ $(block)[powered=true] run data modify storage vexp:projectile redstone.powered set value "true"
function vexp:projectile/utils/redstone/fence_gate_set with storage vexp:projectile redstone
