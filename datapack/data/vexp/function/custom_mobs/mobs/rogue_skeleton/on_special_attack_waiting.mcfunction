#Waiting for attack
execute store result score #rogue_skeleton_random_wait vexp.math run random value 0..250

execute if score #rogue_skeleton_random_wait vexp.math matches ..124 unless block ~ ~-0.25 ~ #air if block ^ ^ ^0.2 #replaceable run tp @s ^ ^ ^0.2 ~-36 ~
execute if score #rogue_skeleton_random_wait vexp.math matches 125.. unless block ~ ~-0.25 ~ #air if block ^ ^ ^0.2 #replaceable run tp @s ^ ^ ^0.2 ~36 ~

#Feedback
particle enchanted_hit ~ ~1 ~ 0.35 0.35 0.35 0 1
