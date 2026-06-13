# Custom on hurt tick hook
# @s is the custom mob
execute if score #striker_random_movement vexp.math matches ..49 if block ^ ^0.4 ^0.1 #replaceable run tp @s ^ ^-0.2 ^1 ~56 ~12
execute if score #striker_random_movement vexp.math matches 50.. if block ^ ^0.4 ^0.1 #replaceable run tp @s ^ ^-0.2 ^1 ~-56 ~12
