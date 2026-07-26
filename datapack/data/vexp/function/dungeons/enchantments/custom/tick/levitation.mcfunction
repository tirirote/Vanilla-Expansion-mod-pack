execute if entity @s[predicate=vexp:is_airborne_sneaking,predicate=vexp:full_saturation] run tag @s add vexp.enchantment_try_to_levitate

execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation matches 1 run effect give @s levitation 1 0 true
execute if entity @s[tag=vexp.enchantment_try_to_levitate] if score @s vexp.enchant.levitation matches 2.. run effect give @s levitation 1 1 true

# Feedback
execute if entity @s[tag=vexp.enchantment_try_to_levitate] run particle effect{color:15519999,power:0.5} ~ ~-0.25 ~ 0.2 0.1 0.2 1 1

# Cleanup
execute unless entity @s[tag=vexp.enchantment_try_to_levitate] run effect clear @s levitation
tag @s remove vexp.enchantment_try_to_levitate
