# Magnetism brigns closer all the item
# @s is the player

# 1. Find candidate item
execute as @e[type=item,nbt={OnGround:1b},distance=..6] unless entity @s[tag=vexp.enchantment_magnetism_item] run tag @s add vexp.enchantment_magnetism_item
execute as @e[type=item,nbt={OnGround:1b},distance=..1] if entity @s[tag=vexp.enchantment_magnetism_item] run tag @s remove vexp.enchantment_magnetism_item

# 2. Tag only this player
execute unless entity @e[type=item,nbt={OnGround:1b},distance=..6,tag=vexp.enchantment_magnetism_item] run tag @s remove vexp.enchantment_magnetism
execute if entity @e[type=item,nbt={OnGround:1b},distance=..6,tag=vexp.enchantment_magnetism_item] run tag @s add vexp.enchantment_magnetism

execute if entity @s[tag=vexp.enchantment_magnetism] as @e[type=item,tag=vexp.enchantment_magnetism_item] at @s run function vexp:dungeons/enchantments/custom/tick/magnetism/magnetism_item_fond
