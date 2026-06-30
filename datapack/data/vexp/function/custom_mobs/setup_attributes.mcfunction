#Set up custom attributes
$attribute @s minecraft:max_health base set $(hp)
$data modify entity @s Health set value $(hp)
$attribute @s minecraft:attack_damage base set $(damage)
$attribute @s minecraft:movement_speed base set $(speed)
$attribute @s scale base set $(scale)
#Set up custom name
$data modify entity @s CustomName set value {text:"$(custom_name)"}
