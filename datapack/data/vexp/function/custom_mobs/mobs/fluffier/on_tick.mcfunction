# On tick hook
# @s is the custom mob
execute store result score @s vexp.rand run random value 0..100
execute if score @s vexp.rand matches ..49 unless block ~ ~-3 ~ #air run tp @s ^ ^0.1 ^0.1 ~22.5 ~
execute if score @s vexp.rand matches 50.. unless block ~ ~-3 ~ #air run tp @s ^ ^0.1 ^0.1 ~-22.5 ~

particle entity_effect{color:1157622151} ~ ~ ~ 0 0 0 0 0
