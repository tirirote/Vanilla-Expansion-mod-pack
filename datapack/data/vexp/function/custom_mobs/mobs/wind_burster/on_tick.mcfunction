# On tick hook
# @s is the custom mob
execute store result score #windbreaker_random_movement vexp.math run random value 0..100
execute if score #windbreaker_random_movement vexp.math matches ..49 unless block ^ ^-2.5 ^-0.1 #replaceable run tp @s ^ ^0.05 ^-0.1
particle small_gust ~ ~ ~ 0.35 0.35 0.35 0 1
