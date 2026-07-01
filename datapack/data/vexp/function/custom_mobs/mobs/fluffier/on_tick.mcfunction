# On tick hook
# @s is the custom mob
execute store result score @s vexp.rand run random value -100..100
execute if entity @p[distance=6..12] if score @s vexp.rand matches 0..20 unless block ~ ~-3 ~ #air run tp @s ^ ^0.4 ^0.5 ~-8 ~
execute if entity @p[distance=6..12] if score @s vexp.rand matches -20..0 unless block ~ ~-3 ~ #air run tp @s ^ ^0.4 ^0.5 ~8 ~

execute if entity @p[distance=..6] if score @s vexp.rand matches 20..50 unless block ~ ~-3 ~ #air run tp @s ^ ^0.1 ^0.1 ~24 ~
execute if entity @p[distance=..6] if score @s vexp.rand matches -50..-20 unless block ~ ~-3 ~ #air run tp @s ^ ^0.1 ^0.1 ~-24 ~
