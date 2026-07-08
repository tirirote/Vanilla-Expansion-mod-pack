# When target hitted by special attack
# @s is the target
particle enchanted_hit ~ ~1 ~ 0.2 0.2 0.2 0.35 35
execute if block ^ ^ ^-1 #replaceable run tp @s ^ ^ ^-1
effect give @s slowness 10 3 true
