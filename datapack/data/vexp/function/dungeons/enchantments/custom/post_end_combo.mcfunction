# Bridge de encantamientos custom al terminar combo.
# @s es el jugador atacante.

execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:shockwave" store result score @s vexp.enchant.shockwave run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:shockwave" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:thundering" store result score @s vexp.enchant.thundering run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:thundering" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:healing" store result score @s vexp.enchant.healing run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:healing" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:wildness" store result score @s vexp.enchant.wildness run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:wildness" 1

execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:shockwave" if score @s vexp.enchant.shockwave matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_shockwave
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:thundering" if score @s vexp.enchant.thundering matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_thundering
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:healing" if score @s vexp.enchant.healing matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_healing
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:wildness" if score @s vexp.enchant.wildness matches 1.. run function vexp:dungeons/enchantments/custom/combo_end/apply_wildness
