# Custom on hurt tick hook
# @s is the custom mob
execute store result score #mothling_random_movement vexp.math run random value 0..100

execute if score #mothling_random_movement vexp.math matches ..49 unless block ~ ~-0.2 ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.5 ~24 ~12
execute if score #mothling_random_movement vexp.math matches 50.. unless block ~ ~-0.2 ~ #replaceable if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.5 ~-24 ~12
