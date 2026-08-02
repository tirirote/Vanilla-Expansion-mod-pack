# dungeons/combo_system/hooks/apply_params_wrapper.mcfunction
# @s is the player (owner)

# Update Storage
function vexp:dungeons/combo_system/update_storage

# Compute effective damage and cooldown accounting for vanilla effects
function vexp:dungeons/combo_system/hooks/compute_effects

# Forward to the macro-based apply_params
function vexp:dungeons/combo_system/hooks/apply_params with storage vexp:dungeons.weapon combo_params
