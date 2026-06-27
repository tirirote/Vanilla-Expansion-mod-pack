# dungeons/combo_system/hooks/apply_interact_params_wrapper.mcfunction
# @s is the player (owner)

# Initialize cooldown if not set
execute unless score @s vexp.skill_cooldown = @s vexp.skill_cooldown run scoreboard players set @s vexp.skill_cooldown 0

# Update storage with THIS player's item info
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality
data remove storage vexp:dungeons.weapon combo_params.right_click_cooldown
data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.right_click_cooldown
execute unless data storage vexp:dungeons.weapon combo_params.right_click_cooldown run data modify storage vexp:dungeons.weapon combo_params.right_click_cooldown set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.cooldown

# Axe hold mechanic: build charge while the use action is maintained.
execute if data storage vexp:dungeons.weapon combo_params{item:"axe"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold
execute if data storage vexp:dungeons.weapon combo_params{item:"pickaxe"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold
execute if data storage vexp:dungeons.weapon combo_params{item:"shovel"} run function vexp:dungeons/combo_system/hooks/interact/handle_interact_hold


# Non-axe items keep the current immediate right-click behavior.
execute unless data storage vexp:dungeons.weapon combo_params{item:"axe"} unless data storage vexp:dungeons.weapon combo_params{item:"pickaxe"} unless data storage vexp:dungeons.weapon combo_params{item:"shovel"} if score @s vexp.skill_cooldown matches 0 run function vexp:dungeons/combo_system/hooks/interact/apply_interact_params with storage vexp:dungeons.weapon combo_params

# Always revoke advancement (regardless of cooldown) to allow re-detection
function vexp:dungeons/combo_system/hooks/revoke_attack_advancement with storage vexp:dungeons.weapon combo_params
