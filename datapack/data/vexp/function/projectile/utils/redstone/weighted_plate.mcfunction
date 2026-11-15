$execute unless block ~ ~ ~ $(block)[power=0] run return 0
data modify storage vexp:projectile redstone set value {kind:"weighted_plate",duration:10}
$data modify storage vexp:projectile redstone.block set value "$(block)"
$setblock ~ ~ ~ $(block)[power=1]
$setblock ~ ~ ~ $(block)[power=0]
