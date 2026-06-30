# Custom on hurt tick hook
# @s is the custom mob
execute store result score #wingler_movement vexp.math run random value 0..100
execute if score #wingler_movement vexp.math matches ..49 if block ^ ^ ^1 #replaceable run tp @s ^ ^0.35 ^0.6 ~56 ~
execute if score #wingler_movement vexp.math matches 50.. if block ^ ^ ^1 #replaceable run tp @s ^ ^0.35 ^0.6 ~-56 ~
