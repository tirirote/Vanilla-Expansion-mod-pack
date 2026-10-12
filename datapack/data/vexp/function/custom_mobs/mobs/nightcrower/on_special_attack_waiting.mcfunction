# Waiting for special attack
# @s is the custom mob
execute if score @s vexp.rand matches ..49 if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^ ~45 ~12
execute if score @s vexp.rand matches 50.. if block ^ ^ ^1 #replaceable run tp @s ^ ^ ^ ~-45 ~12

particle instant_effect{color:7626051} ~ ~1 ~ 0.1 0.5 0.1 0 1

