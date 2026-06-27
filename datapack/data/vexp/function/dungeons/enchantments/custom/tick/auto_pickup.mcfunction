# Auto pickup
# @s is the player
#1. Clean tag for player
execute as @e[type=item,nbt={Age:1s},distance=..12,limit=1] unless data entity @s Thrower run tag @p[limit=1] add vexp.enchantment_pickup_owner
execute if entity @s[tag=vexp.enchantment_pickup_owner] at @s run function vexp:dungeons/enchantments/custom/tick/auto_pickup/pickup_item_success
