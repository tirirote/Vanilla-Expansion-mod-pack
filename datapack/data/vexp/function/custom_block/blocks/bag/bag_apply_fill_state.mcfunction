# Mapear cantidad 1..64 a estado visual

execute store result score #bag_count vexp.id run data get entity @s data.vexp.item_count

execute if score #bag_count vexp.id matches 1..16 run data modify entity @s data.vexp.bag_fill_state set value "almost_empty"
execute if score #bag_count vexp.id matches 17..32 run data modify entity @s data.vexp.bag_fill_state set value "half_full"
execute if score #bag_count vexp.id matches 33..48 run data modify entity @s data.vexp.bag_fill_state set value "almost_full"
execute if score #bag_count vexp.id matches 49..64 run data modify entity @s data.vexp.bag_fill_state set value "full"
