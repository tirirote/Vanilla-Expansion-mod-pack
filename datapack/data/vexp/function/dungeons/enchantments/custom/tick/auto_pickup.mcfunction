# Auto pickup
# @s is the player
tag @s add vexp.autopickup_owner

execute as @e[type=item,nbt={Age:1s},distance=..16] unless data entity @s Thrower unless entity @s[tag=vexp.autopickup_target] run tag @s add vexp.autopickup_target
execute as @e[type=item,tag=vexp.autopickup_target,nbt={Age:1s}] at @s run function vexp:dungeons/enchantments/custom/tick/auto_pickup/pickup_item_success

tag @s remove vexp.autopickup_owner
