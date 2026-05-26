# Bridge de encantamientos vanilla para combo_system.
# @s es el jugador atacante.

scoreboard players set #ench_sharp vexp.math 0
scoreboard players set #ench_smite vexp.math 0
scoreboard players set #ench_bane vexp.math 0
scoreboard players set #ench_fire vexp.math 0
scoreboard players set #ench_kb vexp.math 0

execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sharpness" store result score #ench_sharp vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sharpness" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:smite" store result score #ench_smite vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:smite" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:bane_of_arthropods" store result score #ench_bane vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:bane_of_arthropods" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:fire_aspect" store result score #ench_fire vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:fire_aspect" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:knockback" store result score #ench_kb vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:knockback" 1

execute if score #ench_sharp vexp.math matches 1.. run function vexp:dungeons/enchantments/vanilla/hooks/hit/apply_sharpness
execute if score #ench_smite vexp.math matches 1.. run function vexp:dungeons/enchantments/vanilla/hooks/hit/apply_smite
execute if score #ench_bane vexp.math matches 1.. run function vexp:dungeons/enchantments/vanilla/hooks/hit/apply_bane_of_arthropods
execute if score #ench_fire vexp.math matches 1.. run function vexp:dungeons/enchantments/vanilla/hooks/hit/apply_fire_aspect
execute if score #ench_kb vexp.math matches 1.. run function vexp:dungeons/enchantments/vanilla/hooks/hit/apply_knockback
