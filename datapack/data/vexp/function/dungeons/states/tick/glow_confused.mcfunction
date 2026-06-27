execute store result score @s vexp.math run random value 0..100
execute if score @s vexp.math matches 0..49 unless block ~ ~-0.1 ~ #air run tp @s ~ ~ ~ ~12 ~5
execute if score @s vexp.math matches 50..100 unless block ~ ~-0.1 ~ #air run tp @s ~ ~ ~ ~-12 ~5
