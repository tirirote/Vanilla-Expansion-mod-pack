# dungeons/armor/types/diamond/on_sprint.mcfunction

# Chance to recover durability
execute if score @s vexp.armor_rand matches -5..5 if data entity @s SelectedItem.components."minecraft:custom_data".vexp.item run function vexp:dungeons/armor/types/diamond/durability_main_hand_bonus
execute if score @s vexp.armor_rand matches -5..5 if data entity @s equipment.offhand.components."minecraft:custom_data".vexp.item run function vexp:dungeons/armor/types/diamond/durability_off_hand_bonus

particle dust_color_transition{from_color:3788726,to_color:36214,scale:1.7} ~ ~0.25 ~ 0.35 0 0.35 1 1
particle instant_effect{color:3788726,power:1} ~ ~0.25 ~ 0.35 0 0.35 1 1
