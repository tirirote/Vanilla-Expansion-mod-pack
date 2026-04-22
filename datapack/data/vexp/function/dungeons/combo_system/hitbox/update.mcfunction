# dungeons/combo_system/hitbox/update.mcfunction

# Update local storage with current item combo data
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo

# Also copy the 'item' identifier for our hooks
data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item

# Copy quality routing key (normal|gold|diamond|netherite|echo)
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# Offload logic to conditional evaluator Macro
function vexp:dungeons/combo_system/hitbox/evaluate_summon with storage vexp:dungeons.weapon combo_params
