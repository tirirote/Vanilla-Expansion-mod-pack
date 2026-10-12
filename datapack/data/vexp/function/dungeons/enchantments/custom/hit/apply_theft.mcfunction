# Apply Theft Enchantment
# @s is the player
execute unless entity @s[predicate=vexp:is_sneaking] run return 0

# Chance per hit target (%): I = 15, II = 30
scoreboard players set #theft_chance vexp.math 30
execute if score @s vexp.enchant.theft matches 2.. run scoreboard players set #theft_chance vexp.math 60

# Roll per target, then drop one item from each target that passed
execute as @e[tag=vexp.hitted] run function vexp:dungeons/enchantments/custom/hit/theft_try
execute at @e[tag=vexp.theft_target] run function vexp:dungeons/enchantments/custom/hit/theft_drop

# Feedback
execute as @e[tag=vexp.theft_target,limit=1] at @s run function vexp:dungeons/fx/enchantments/theft

# Cleanup
tag @e[tag=vexp.theft_target] remove vexp.theft_target
