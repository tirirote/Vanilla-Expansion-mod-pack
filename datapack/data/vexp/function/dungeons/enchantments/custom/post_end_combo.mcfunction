# Bridge de encantamientos custom al terminar combo.
# @s es el jugador atacante.

scoreboard players set #ench_shockwave vexp.math 0
scoreboard players set #ench_thundering vexp.math 0
scoreboard players set #ench_healing vexp.math 0
scoreboard players set #ench_thrust vexp.math 0
scoreboard players set #ench_wildness vexp.math 0

execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:shockwave" store result score #ench_shockwave vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:shockwave" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:thundering" store result score #ench_thundering vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:thundering" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:healing" store result score #ench_healing vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:healing" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:thrust" store result score #ench_thrust vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:thrust" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:wildness" store result score #ench_wildness vexp.math run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:wildness" 1

execute if score #ench_shockwave vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_shockwave
execute if score #ench_thundering vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_thundering
execute if score #ench_healing vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_healing
execute if score #ench_thrust vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_thrust
execute if score #ench_wildness vexp.math matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_wildness
