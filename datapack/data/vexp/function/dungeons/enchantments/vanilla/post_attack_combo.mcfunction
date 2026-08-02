# Bridge de encantamientos vanilla para combo_system.
# @s es el jugador atacante.

# Reset all enchants
scoreboard players reset @s vexp.enchant.sharpness
scoreboard players reset @s vexp.enchant.smite
scoreboard players reset @s vexp.enchant.bane_of_arthropods
scoreboard players reset @s vexp.enchant.fire_aspect
scoreboard players reset @s vexp.enchant.knockback
scoreboard players reset @s vexp.enchant.sweeping_edge

# Get offhand enchantments
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:sharpness" store result score @s vexp.enchant.sharpness run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:sharpness" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:smite" store result score @s vexp.enchant.smite run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:smite" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:bane_of_arthropods" store result score @s vexp.enchant.bane_of_arthropods run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:bane_of_arthropods" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:fire_aspect" store result score @s vexp.enchant.fire_aspect run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:fire_aspect" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:knockback" store result score @s vexp.enchant.knockback run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:knockback" 1
execute if data entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:sweeping_edge" store result score @s vexp.enchant.sweeping_edge run data get entity @s equipment.offhand.components."minecraft:enchantments"."minecraft:sweeping_edge" 1

# Get mainhand enchatments
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sharpness" store result score @s vexp.enchant.sharpness run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sharpness" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:smite" store result score @s vexp.enchant.smite run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:smite" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:bane_of_arthropods" store result score @s vexp.enchant.bane_of_arthropods run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:bane_of_arthropods" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:fire_aspect" store result score @s vexp.enchant.fire_aspect run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:fire_aspect" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:knockback" store result score @s vexp.enchant.knockback run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:knockback" 1
execute if data entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sweeping_edge" store result score @s vexp.enchant.sweeping_edge run data get entity @s SelectedItem.components."minecraft:enchantments"."minecraft:sweeping_edge" 1

# Execute enchantments
execute if score @s vexp.enchant.sharpness matches 1.. run function vexp:dungeons/enchantments/vanilla/hit/apply_sharpness
execute if score @s vexp.enchant.smite matches 1.. run function vexp:dungeons/enchantments/vanilla/hit/apply_smite
execute if score @s vexp.enchant.bane_of_arthropods matches 1.. run function vexp:dungeons/enchantments/vanilla/hit/apply_bane_of_arthropods
execute if score @s vexp.enchant.fire_aspect matches 1.. run function vexp:dungeons/enchantments/vanilla/hit/apply_fire_aspect
execute if score @s vexp.enchant.knockback matches 1.. run function vexp:dungeons/enchantments/vanilla/hit/apply_knockback
execute if score @s vexp.enchant.sweeping_edge matches 1.. run function vexp:dungeons/enchantments/vanilla/hit/apply_sweeping_edge
