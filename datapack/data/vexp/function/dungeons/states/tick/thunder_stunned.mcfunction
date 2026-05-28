effect give @s slowness 3 0 true

particle electric_spark ~ ~1 ~ 0.35 0.5 0.35 0.3 5

execute store result score @s vexp.math run random value 0..50
execute if score @s vexp.math matches 0..24 unless block ~ ~-0.1 ~ #air run tp @s ~ ~ ~ ~8 ~5
execute if score @s vexp.math matches 25..50 unless block ~ ~-0.1 ~ #air run tp @s ~ ~ ~ ~-8 ~5
