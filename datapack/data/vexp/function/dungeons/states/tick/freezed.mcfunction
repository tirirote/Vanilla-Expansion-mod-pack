execute if score #ench_freezing vexp.math matches 1 run effect give @e[tag=vexp.hitted] minecraft:slowness 5 0 true
execute if score #ench_freezing vexp.math matches 1 run effect give @e[tag=vexp.hitted] minecraft:mining_fatigue 5 0 true

execute if score #ench_freezing vexp.math matches 2 run effect give @e[tag=vexp.hitted] minecraft:slowness 5 1 true
execute if score #ench_freezing vexp.math matches 2 run effect give @e[tag=vexp.hitted] minecraft:mining_fatigue 5 1 true

execute if score #ench_freezing vexp.math matches 3.. run effect give @e[tag=vexp.hitted] minecraft:slowness 5 2 true
execute if score #ench_freezing vexp.math matches 3.. run effect give @e[tag=vexp.hitted] minecraft:mining_fatigue 5 2 true

# Feedback
particle snowflake ~ ~1 ~ 0.35 0.35 0.35 0.01 1
particle entity_effect{color:-1850085377} ~ ~1 ~ 0.5 0.2 0.5 0 1
