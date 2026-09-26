# @s is the player; $(item_path) is SelectedItem or equipment.offhand.
scoreboard players set @s vexp.durability_skip 0
scoreboard players set @s vexp.enchant.unbreaking 0
scoreboard players set @s vexp.unbreaking_roll 0

$execute if data entity @s $(item_path).components."minecraft:enchantments"."minecraft:unbreaking" store result score @s vexp.enchant.unbreaking run data get entity @s $(item_path).components."minecraft:enchantments"."minecraft:unbreaking" 1

execute if score @s vexp.enchant.unbreaking matches 1 store result score @s vexp.unbreaking_roll run random value 1..2
execute if score @s vexp.enchant.unbreaking matches 2 store result score @s vexp.unbreaking_roll run random value 1..3
execute if score @s vexp.enchant.unbreaking matches 3.. store result score @s vexp.unbreaking_roll run random value 1..4

execute if score @s vexp.enchant.unbreaking matches 1 if score @s vexp.unbreaking_roll matches 1 run scoreboard players set @s vexp.durability_skip 1
execute if score @s vexp.enchant.unbreaking matches 2 if score @s vexp.unbreaking_roll matches ..2 run scoreboard players set @s vexp.durability_skip 1
execute if score @s vexp.enchant.unbreaking matches 3.. if score @s vexp.unbreaking_roll matches ..3 run scoreboard players set @s vexp.durability_skip 1
