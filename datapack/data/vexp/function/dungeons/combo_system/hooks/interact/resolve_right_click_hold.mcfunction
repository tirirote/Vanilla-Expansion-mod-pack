# 2.2 Resolve hold-release skills (ready + no longer holding).
execute if score @s vexp.skill_hold_time matches 1.. run data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
execute if score @s vexp.skill_hold_time matches 1.. run data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
execute if score @s vexp.skill_hold_time matches 1.. run data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
execute if score @s vexp.skill_hold_time matches 1.. run data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality
execute if score @s vexp.skill_hold_time matches 1.. run data remove storage vexp:dungeons.weapon combo_params.right_click_cooldown
execute if score @s vexp.skill_hold_time matches 1.. run data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.right_click_cooldown
execute if score @s vexp.skill_hold_time matches 1.. unless data storage vexp:dungeons.weapon combo_params.right_click_cooldown run data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.cooldown

execute if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/apply_interact_params with storage vexp:dungeons.weapon combo_params

execute if score @s vexp.skill_hold_time matches 1.. run scoreboard players set @s vexp.skill_hold_time 0

tag @s remove vexp.skill_hold_ready
