# Custom on hurt tick hook
# @s is the custom mob
execute if score @s vexp.rand matches ..49 unless block ~ ~-0.5 ~ #air if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.1 ~64 ~
execute if score @s vexp.rand matches 50.. unless block ~ ~-0.5 ~ #air if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.1 ~-64 ~
