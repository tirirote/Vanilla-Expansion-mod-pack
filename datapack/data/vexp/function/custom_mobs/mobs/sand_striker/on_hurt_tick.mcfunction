# Custom on hurt tick hook
# @s is the custom mob
execute store result score #striker_random_movement vexp.math run random value 0..100

execute if score #striker_random_movement vexp.math matches ..49 if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.5 ~56 ~12
execute if score #striker_random_movement vexp.math matches 50.. if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.5 ~-56 ~12
