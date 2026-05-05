# Mapear cantidad 1..64 a estado visual

execute store result score #jar_count vexp.id run data get entity @s data.vexp.item_count

execute if score #jar_count vexp.id matches 1..12 run data modify entity @s data.vexp.jar_fill_state set value "almost_empty"
execute if score #jar_count vexp.id matches 13..25 run data modify entity @s data.vexp.jar_fill_state set value "half_empty"
execute if score #jar_count vexp.id matches 26..38 run data modify entity @s data.vexp.jar_fill_state set value "half_full"
execute if score #jar_count vexp.id matches 39..51 run data modify entity @s data.vexp.jar_fill_state set value "almost_full"
execute if score #jar_count vexp.id matches 52..64 run data modify entity @s data.vexp.jar_fill_state set value "full"
