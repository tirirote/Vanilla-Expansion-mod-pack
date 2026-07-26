# Resonance enchantment buff
# @s is the player to be buffed
tag @s add vexp.enchantment_resonance_buff
scoreboard players set @s vexp.dstate 40

effect give @s speed 3 1 true
effect give @s glowing 2 0 true
# Glowing color
team join vexp.blue @s
