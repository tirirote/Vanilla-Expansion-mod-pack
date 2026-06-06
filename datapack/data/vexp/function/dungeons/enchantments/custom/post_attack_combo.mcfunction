# Bridge de encantamientos custom para combo_system.
# @s es el jugador atacante.

scoreboard players set #ench_committed vexp.math 0
scoreboard players set #ench_backstab vexp.math 0
scoreboard players set #ench_lifesteal vexp.math 0
scoreboard players set #ench_pursuit vexp.math 0
scoreboard players set #ench_freezing vexp.math 0
scoreboard players set #ench_execute vexp.math 0
scoreboard players set #ench_first_strike vexp.math 0
scoreboard players set #ench_ender_slayer vexp.math 0
scoreboard players set #ench_cubism vexp.math 0
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:committed" store result score #ench_committed vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:committed" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:backstab" store result score #ench_backstab vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:backstab" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:lifesteal" store result score #ench_lifesteal vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:lifesteal" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:pursuit" store result score #ench_pursuit vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:pursuit" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:freeze" store result score #ench_freezing vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:freeze" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:execute" store result score #ench_execute vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:execute" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:first_strike" store result score #ench_first_strike vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:first_strike" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:ender_slayer" store result score #ench_ender_slayer vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:ender_slayer" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:cubism" store result score #ench_cubism vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:cubism" 1

execute if score #ench_committed vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_committed
execute if score #ench_backstab vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_backstab
execute if score #ench_lifesteal vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_lifesteal
execute if score #ench_pursuit vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_pursuit
execute if score #ench_freezing vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_freezing
execute if score #ench_execute vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_execute
execute if score #ench_first_strike vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_first_strike
execute if score #ench_ender_slayer vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_ender_slayer
execute if score #ench_cubism vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_cubism
