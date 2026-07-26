# Improved movement when full hunger
execute store result score #light_step_rand vexp.rand run random value 0..5

execute if score #light_step_rand vexp.rand matches 1 if entity @s[predicate=!vexp:is_sprinting,predicate=vexp:full_saturation] run particle instant_effect{color:11711487,power:2} ~ ~0.5 ~ 0.25 0.1 0.25 0 1

execute if score @s vexp.enchant.light_step matches 1 if entity @s[predicate=vexp:is_sprinting,predicate=vexp:full_saturation] run effect give @s speed 1 1 true
execute if score @s vexp.enchant.light_step matches 1 if entity @s[predicate=vexp:is_sprinting,predicate=vexp:full_saturation] run effect give @s jump_boost 1 1 true

execute if score @s vexp.enchant.light_step matches 2.. if entity @s[predicate=vexp:is_sprinting,predicate=vexp:full_saturation] run effect give @s speed 1 2 true
execute if score @s vexp.enchant.light_step matches 2.. if entity @s[predicate=vexp:is_sprinting,predicate=vexp:full_saturation] run effect give @s jump_boost 1 2 true

# Feedback
execute if entity @s[predicate=vexp:is_sprinting,predicate=vexp:full_saturation] unless block ~ ~-0.5 ~ #replaceable run particle instant_effect{color:14021631,power:1} ~ ~0.125 ~ 0.25 0.1 0.25 1 1
execute if entity @s[predicate=vexp:is_sprinting,predicate=vexp:full_saturation] unless block ~ ~-0.5 ~ #replaceable run particle instant_effect{color:12965119,power:1} ~ ~0.125 ~ 0.25 0.1 0.25 1 1
