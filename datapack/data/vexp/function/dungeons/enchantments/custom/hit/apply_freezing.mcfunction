# Freezing: apply slowness and mining fatigue to the hit target.
execute as @e[tag=vexp.hitted] at @s run function vexp:dungeons/states/freezed

#Feedback
execute as @e[tag=vexp.hitted,limit=1] at @s run function vexp:dungeons/fx/enchantments/freezing
