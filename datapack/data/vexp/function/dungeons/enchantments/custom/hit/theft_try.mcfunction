# @s is a hit target. Marks it as theft_target when the roll passes.
execute if entity @s[type=player] run return 0
execute if entity @s[tag=vexp.custom_block.dummy_mob] run return 0

execute store result score #theft_roll vexp.math run random value 1..100
execute if score #theft_roll vexp.math > #theft_chance vexp.math run return 0

tag @s add vexp.theft_target
