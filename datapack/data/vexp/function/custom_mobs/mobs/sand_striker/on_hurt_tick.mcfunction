#Custom on Hurt hook
execute if score #striker_random_movement vexp.math matches ..49 if block ^ ^0.1 ^0.1 #replaceable run tp @s ^ ^-0.2 ^1 ~48 ~
execute if score #striker_random_movement vexp.math matches 50.. if block ^ ^0.1 ^0.1 #replaceable run tp @s ^ ^-0.2 ^1 ~-48 ~
