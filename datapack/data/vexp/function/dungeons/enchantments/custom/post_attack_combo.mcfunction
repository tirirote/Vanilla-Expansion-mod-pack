# Bridge de encantamientos custom para combo_system.
# @s es el jugador atacante.

scoreboard players set #ench_committed vexp.math 0
scoreboard players set #ench_backstab vexp.math 0
scoreboard players set #ench_lifesteal vexp.math 0
scoreboard players set #ench_pursuit vexp.math 0
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:committed" store result score #ench_committed vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:committed" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:backstab" store result score #ench_backstab vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:backstab" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:lifesteal" store result score #ench_lifesteal vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:lifesteal" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:pursuit" store result score #ench_pursuit vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:pursuit" 1

execute if score #ench_committed vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_committed
execute if score #ench_backstab vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_backstab
execute if score #ench_lifesteal vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_lifesteal
execute if score #ench_pursuit vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_pursuit
