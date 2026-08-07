# Armor enchantments

# Head
# Magnetism
execute if data entity @s equipment.head.components."minecraft:enchantments"."vexp:magnetism" store result score @s vexp.enchant.magnetism run data get entity @s equipment.head.components."minecraft:enchantments"."vexp:magnetism" 1
execute if data entity @s equipment.head.components."minecraft:enchantments"."vexp:magnetism" if score @s vexp.enchant.magnetism matches 1.. at @s run function vexp:dungeons/enchantments/custom/tick/magnetism
execute unless data entity @s equipment.head.components."minecraft:enchantments"."vexp:magnetism" as @e[tag=vexp.enchantment_magnetism_item] run function vexp:dungeons/enchantments/custom/tick/magnetism/magnetism_item_cleanup

# Chest
# Resonance
execute if data entity @s equipment.chest.components."minecraft:enchantments"."vexp:resonance" store result score @s vexp.enchant.resonance run data get entity @s equipment.chest.components."minecraft:enchantments"."vexp:resonance" 1
execute if data entity @s equipment.chest.components."minecraft:enchantments"."vexp:resonance" if score @s vexp.enchant.resonance matches 1.. run function vexp:dungeons/enchantments/custom/tick/resonance

# Taunt
execute if data entity @s equipment.chest.components."minecraft:enchantments"."vexp:taunt" store result score @s vexp.enchant.taunt run data get entity @s equipment.chest.components."minecraft:enchantments"."vexp:taunt" 1
execute if data entity @s equipment.chest.components."minecraft:enchantments"."vexp:taunt" if score @s vexp.enchant.taunt matches 1.. at @s run function vexp:dungeons/enchantments/custom/tick/taunt
execute unless data entity @s equipment.chest.components."minecraft:enchantments"."vexp:taunt" run tag @s[tag=vexp.enchantment_taunt] remove vexp.enchantment_taunt


# Leggings
# Levitation
execute if data entity @s equipment.legs.components."minecraft:enchantments"."vexp:levitation" store result score @s vexp.enchant.levitation run data get entity @s equipment.legs.components."minecraft:enchantments"."vexp:levitation" 1
execute if data entity @s equipment.legs.components."minecraft:enchantments"."vexp:levitation" if score @s vexp.enchant.levitation matches 1.. at @s run function vexp:dungeons/enchantments/custom/tick/levitation
execute unless data entity @s equipment.legs.components."minecraft:enchantments"."vexp:levitation" run tag @s[tag=vexp.enchantment_try_to_levitate] remove vexp.enchantment_try_to_levitate

# Feet

# Light Step
execute if data entity @s equipment.feet.components."minecraft:enchantments"."vexp:light_step" store result score @s vexp.enchant.light_step run data get entity @s equipment.feet.components."minecraft:enchantments"."vexp:light_step" 1
execute if data entity @s equipment.feet.components."minecraft:enchantments"."vexp:light_step" if score @s vexp.enchant.light_step matches 1.. at @s run function vexp:dungeons/enchantments/custom/tick/light_step
