# Scarab check for activation
tag @s add vexp.scarab_owner

# x12 the loot recieved in 6 block radius
execute as @e[type=item,distance=..16,nbt={Age:1s}] if items entity @s contents #vexp:scarab_target unless data entity @s Thrower unless entity @s[tag=vexp.scarab_duplicate] unless entity @s[tag=vexp.scarab_duplicate_loot] unless entity @s[tag=vexp.scarab_count] at @s run function vexp:artifacts/activate/scarab/item_counting

# When at least 3 items trigger activation
execute if score @s vexp.scarab_item_count matches 3.. run function vexp:artifacts/activate/scarab

tag @s remove vexp.scarab_owner
