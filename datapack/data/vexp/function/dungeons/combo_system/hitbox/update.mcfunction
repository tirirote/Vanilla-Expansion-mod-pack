# dungeons/combo_system/hitbox/update.mcfunction

# Update local storage with current item combo data
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo

# Also copy the 'item' identifier for our hooks
data modify storage vexp:main combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item

# Offload logic to conditional evaluator Macro
function vexp:dungeons/combo_system/hitbox/evaluate_summon with storage vexp:main combo_params
