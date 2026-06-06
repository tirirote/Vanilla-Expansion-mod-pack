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
execute if data storage vexp:dungeons.weapon combo_params{item:"axe"} if score @s vexp.skill_cooldown matches 0 run tag @s add vexp.skill_hold_active
execute if data storage vexp:dungeons.weapon combo_params{item:"axe"} if score @s vexp.skill_cooldown matches 0 run scoreboard players add @s vexp.skill_hold_time 1

#On hold hook
execute if data storage vexp:dungeons.weapon combo_params{item:"axe"} if score @s vexp.skill_cooldown matches 0 if score @s vexp.skill_hold_time matches 1.. unless entity @s[tag=vexp.skill_hold_ready] run function vexp:dungeons/combo_system/hooks/interact/route_on_right_click_hold with storage vexp:dungeons.weapon combo_params

#Hold Ready
execute if data storage vexp:dungeons.weapon combo_params{item:"axe"} if score @s vexp.skill_cooldown matches 0 if score @s vexp.skill_hold_time matches 8.. run tag @s add vexp.skill_hold_ready

# Non-axe items keep the current immediate right-click behavior.
execute unless data storage vexp:dungeons.weapon combo_params{item:"axe"} if score @s vexp.skill_cooldown matches 0 run function vexp:dungeons/combo_system/hooks/interact/apply_interact_params with storage vexp:dungeons.weapon combo_params

# Always revoke advancement (regardless of cooldown) to allow re-detection
function vexp:dungeons/combo_system/hooks/revoke_attack_advancement with storage vexp:dungeons.weapon combo_params
