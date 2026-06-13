# On tick hook
# @s is the custom mob
execute store result score #striker_random_movement vexp.math run random value 0..100

#Slow movement on land
execute if score #striker_random_movement vexp.math matches ..49 unless block ^ ^-0.2 ^-0.1 #sand unless block ^ ^-0.4 ^0.1 #replaceable run tp @s ^ ^-0.1 ^0.1 ~ ~12
execute if score #striker_random_movement vexp.math matches 50.. unless block ^ ^-0.2 ^-0.1 #sand unless block ^ ^-0.4 ^0.1 #replaceable run tp @s ^ ^-0.1 ^0.1 ~ ~-12
execute unless block ^ ^0.4 ^0.1 #sand unless block ^ ^0.4 ^0.1 #replaceable run tp @s ^ ^0.1 ^0.1 ~ ~-12


#When inside sand cant take damage
execute if block ^ ^-1 ^0.1 #sand run effect give @s resistance 2 3 true

#Bury itself in sand
execute if score #striker_random_movement vexp.math matches ..49 if block ^ ^-0.2 ^0.1 #sand run tp @s ^ ^-0.1 ^0.3 ~8 ~12
execute if score #striker_random_movement vexp.math matches 50.. if block ^ ^-0.2 ^0.1 #sand run tp @s ^ ^-0.1 ^0.3 ~-8 ~-12
execute if block ^ ^0.4 ^0.1 #sand run tp @s ^ ^0.1 ^0.3 ~ ~-12

# Bury feedback
execute if block ^ ^ ^0.1 #sand run particle block{block_state:sand} ^ ^ ^0.2 0.2 0.2 0.2 0.2 1
