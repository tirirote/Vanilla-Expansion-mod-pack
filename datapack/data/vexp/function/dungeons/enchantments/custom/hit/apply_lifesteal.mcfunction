# Lifesteal I/II: grant regeneration to attacker on hit.
execute if score #ench_lifesteal vexp.math matches 1 run effect give @s minecraft:regeneration 5 0 true
execute if score #ench_lifesteal vexp.math matches 2.. run effect give @s minecraft:regeneration 5 1 true

#Feedback
execute as @e[tag=vexp.hitted,distance=..8] at @s run function vexp:dungeons/fx/enchantments/health_steal
