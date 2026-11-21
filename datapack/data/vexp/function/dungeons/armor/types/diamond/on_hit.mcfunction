# dungeons/armor/types/diamond/on_hit.mcfunction

# Chance to recover durability
execute if score @s vexp.armor_rand matches -275..275 if data entity @s SelectedItem.components."minecraft:custom_data".vexp.item run function vexp:dungeons/armor/types/diamond/durability_main_hand_bonus
execute if score @s vexp.armor_rand matches -275..275 if data entity @s equipment.offhand.components."minecraft:custom_data".vexp.item run function vexp:dungeons/armor/types/diamond/durability_main_hand_bonus
