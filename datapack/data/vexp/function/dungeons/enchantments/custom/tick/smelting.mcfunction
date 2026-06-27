# Auto smelting tick
# @s is the player
execute as @e[type=item,sort=nearest,distance=..10,nbt={Age:1s}] unless data entity @s Thrower unless entity @s[tag=vexp.enchantment_smelted] at @s run function vexp:dungeons/enchantments/custom/tick/smelting/smelting_whitelist
