# Bridge de encantamientos custom para combo_system.
# @s es el jugador atacante.

# Reset all enchants
scoreboard players reset @s vexp.enchant.committed
scoreboard players reset @s vexp.enchant.backstab
scoreboard players reset @s vexp.enchant.lifesteal
scoreboard players reset @s vexp.enchant.pursuit
scoreboard players reset @s vexp.enchant.freeze
scoreboard players reset @s vexp.enchant.execute
scoreboard players reset @s vexp.enchant.first_strike
scoreboard players reset @s vexp.enchant.ender_slayer
scoreboard players reset @s vexp.enchant.cubism

# Get offhand enchantments
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:committed" store result score @s vexp.enchant.committed run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:committed" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:backstab" store result score @s vexp.enchant.backstab run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:backstab" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:lifesteal" store result score @s vexp.enchant.lifesteal run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:lifesteal" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:pursuit" store result score @s vexp.enchant.pursuit run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:pursuit" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:freeze" store result score @s vexp.enchant.freeze run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:freeze" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:execute" store result score @s vexp.enchant.execute run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:execute" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:first_strike" store result score @s vexp.enchant.first_strike run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:first_strike" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:ender_slayer" store result score @s vexp.enchant.ender_slayer run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:ender_slayer" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."vexp:cubism" store result score @s vexp.enchant.cubism run data get entity @s equipment.offhand.components."minecraft:enchantments"."vexp:cubism" 1

# Get mainhand enchantments
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:committed" store result score @s vexp.enchant.committed run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:committed" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:backstab" store result score @s vexp.enchant.backstab run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:backstab" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:lifesteal" store result score @s vexp.enchant.lifesteal run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:lifesteal" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:pursuit" store result score @s vexp.enchant.pursuit run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:pursuit" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:freeze" store result score @s vexp.enchant.freeze run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:freeze" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:execute" store result score @s vexp.enchant.execute run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:execute" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:first_strike" store result score @s vexp.enchant.first_strike run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:first_strike" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:ender_slayer" store result score @s vexp.enchant.ender_slayer run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:ender_slayer" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."vexp:cubism" store result score @s vexp.enchant.cubism run data get entity @s SelectedItem.components."minecraft:enchantments"."vexp:cubism" 1

# Execute enchantments
execute if score @s vexp.enchant.committed matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_committed
execute if score @s vexp.enchant.backstab matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_backstab
execute if score @s vexp.enchant.lifesteal matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_lifesteal
execute if score @s vexp.enchant.pursuit matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_pursuit
execute if score @s vexp.enchant.freeze matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_freezing
execute if score @s vexp.enchant.execute matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_execute
execute if score @s vexp.enchant.first_strike matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_first_strike
execute if score @s vexp.enchant.ender_slayer matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_ender_slayer
execute if score @s vexp.enchant.cubism matches 1.. run function vexp:dungeons/enchantments/custom/hit/apply_cubism
