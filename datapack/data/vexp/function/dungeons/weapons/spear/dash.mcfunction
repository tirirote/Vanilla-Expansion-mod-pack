#Dash
execute positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable run tp ^ ^ ^1
execute positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^ ^2 #replaceable run tp ^ ^ ^2
execute positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^ ^2 #replaceable if block ^ ^ ^3 #replaceable run tp ^ ^ ^3
execute positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^ ^2 #replaceable if block ^ ^ ^3 #replaceable if block ^ ^ ^4 #replaceable run tp ^ ^ ^4
execute positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^ ^2 #replaceable if block ^ ^ ^3 #replaceable if block ^ ^ ^4 #replaceable if block ^ ^ ^5 #replaceable run tp ^ ^ ^5

# Lunge adds one collision-checked block of travel per enchantment level.
scoreboard players set @s vexp.enchant.lunge 0
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:lunge" store result score @s vexp.enchant.lunge run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:lunge" 1
execute if score @s vexp.enchant.lunge matches 1.. positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run tp @s ^ ^ ^1
execute if score @s vexp.enchant.lunge matches 2.. positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run tp @s ^ ^ ^1
execute if score @s vexp.enchant.lunge matches 3.. positioned ~ ~-0.5 ~ if block ^ ^ ^1 #replaceable if block ^ ^1 ^1 #replaceable run tp @s ^ ^ ^1
