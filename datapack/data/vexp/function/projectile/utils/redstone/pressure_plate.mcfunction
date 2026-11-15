$execute unless block ~ ~ ~ $(block)[powered=false] run return 0
data modify storage vexp:projectile redstone set value {kind:"plate",duration:20}
$data modify storage vexp:projectile redstone.block set value "$(block)"
$setblock ~ ~ ~ $(block)[powered=true]
$setblock ~ ~ ~ $(block)[powered=false]
