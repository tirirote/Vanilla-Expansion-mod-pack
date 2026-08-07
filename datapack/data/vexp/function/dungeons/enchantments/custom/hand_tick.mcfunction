# Hand tools / weapons tick enchantments
# Auto Pickup
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:auto_pickup" store result score @s vexp.enchant.auto_pickup run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:auto_pickup" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:auto_pickup" if score @s vexp.enchant.auto_pickup matches 1.. at @s run function vexp:dungeons/enchantments/custom/tick/auto_pickup

# Smelting
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:smelting" store result score @s vexp.enchant.smelting run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:smelting" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:smelting" if score @s vexp.enchant.smelting matches 1.. at @s run function vexp:dungeons/enchantments/custom/tick/smelting
