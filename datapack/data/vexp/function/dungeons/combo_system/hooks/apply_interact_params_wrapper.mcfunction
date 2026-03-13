# dungeons/combo_system/hooks/apply_interact_params_wrapper.mcfunction
# @s is the player (owner)

# Initialize cooldown if not set
execute unless score @s vexp.combo_cooldown = @s vexp.combo_cooldown run scoreboard players set @s vexp.combo_cooldown 0

# Update storage with THIS player's item info
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:main combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:main combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:main combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# Legacy fallback: older items may store quality at vexp.quality
execute unless data storage vexp:main combo_params{quality:"normal"} unless data storage vexp:main combo_params{quality:"netherite"} unless data storage vexp:main combo_params{quality:"echo"} unless data storage vexp:main combo_params{quality:"amethyst"} run data modify storage vexp:main combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.quality

# Only execute if cooldown is 0
execute if score @s vexp.combo_cooldown matches 0 run function vexp:dungeons/combo_system/hooks/apply_interact_params with storage vexp:main combo_params

# Always revoke advancement (regardless of cooldown) to allow re-detection
function vexp:dungeons/combo_system/hooks/revoke_attack_advancement with storage vexp:main combo_params
