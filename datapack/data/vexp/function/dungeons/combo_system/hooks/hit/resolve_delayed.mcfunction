# dungeons/combo_system/hooks/hit/resolve_delayed.mcfunction
# @s is the player

# Refresh combo params from current item context before resolving delayed hit.
data modify storage vexp:dungeons.weapon combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
data modify storage vexp:dungeons.weapon combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item
data modify storage vexp:dungeons.weapon combo_params.type set from entity @s SelectedItem.components."minecraft:custom_data".vexp.type
data modify storage vexp:dungeons.weapon combo_params.quality set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo.quality

# Recompute effect-adjusted params for delayed damage application.
function vexp:dungeons/combo_system/hooks/compute_effects

# Mark attacker and detect critical state at the delayed resolution frame.
tag @s add vexp.attacker

# Resolve damage and post-hit hooks.
function vexp:dungeons/combo_system/hitbox/damage_aoe with storage vexp:dungeons.weapon combo_params
function vexp:dungeons/combo_system/hooks/hit/handle_hit with storage vexp:dungeons.weapon combo_params

# Clear pending state for this queued hit.
tag @s remove vexp.hit_delay.pending
scoreboard players set @s vexp.hit_delay 0
