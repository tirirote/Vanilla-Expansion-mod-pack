# Custom eating wrapper
# @s is the custom mob

execute store result score @s vexp.mob_eating_time run random value 0..50

# 1. Custom eating hook
$execute if score @s vexp.mob_eating_time matches 40.. run function vexp:custom_mobs/mobs/$(type)/on_eating

# 2. Eat the item successfully
execute if score @s vexp.mob_eating_time matches 1 run function vexp:custom_mobs/behaviour/eat_success with entity @s data.vexp.mob
