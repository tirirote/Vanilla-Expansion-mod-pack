# Custom on hurt tick hook
# @s is the custom mob

execute if score @s vexp.rand matches ..49 if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.5 ~56 ~12
execute if score @s vexp.rand matches 50.. if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^0.5 ~-56 ~12
