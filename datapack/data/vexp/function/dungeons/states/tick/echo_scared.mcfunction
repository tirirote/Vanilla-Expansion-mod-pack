particle sculk_charge_pop ~ ~1 ~ 0.2 0.5 0.2 0.01 1

execute store result score @s vexp.math run random value 0..100

execute if score @s vexp.math matches 0..49 unless block ~ ~-0.1 ~ #air if block ^ ^ ^0.05 #replaceable run tp @s ^ ^ ^0.05 ~12 ~12
execute if score @s vexp.math matches 50..100 unless block ~ ~-0.1 ~ #air if block ^ ^ ^0.05 #replaceable run tp @s ^ ^ ^0.05 ~-12 ~12
