# dungeons/combo_system/hooks/hit/resolve_delayed.mcfunction
# @s is the player

# Refresh combo params using the same weapon selection policy as live hit/interact flow.
function vexp:dungeons/combo_system/update_storage

# Recompute effect-adjusted params for delayed damage application.
function vexp:dungeons/combo_system/hooks/compute_effects

# Mark attacker and detect critical state at the delayed resolution frame.
tag @s add vexp.attacker

# Resolve damage and post-hit hooks.
function vexp:dungeons/combo_system/hitbox/tag_hitted with storage vexp:dungeons.weapon combo_params
execute as @e[tag=vexp.hitted] run scoreboard players set @s vexp.hit_success 0

# Process other hooks before applying damage
function vexp:dungeons/armor/on_hit
function vexp:dungeons/enchantments/post_attack_combo

# Resolve Damage
function vexp:dungeons/combo_system/hitbox/resolve_eff_damage with storage vexp:dungeons.weapon combo_params

function vexp:dungeons/combo_system/hooks/hit/handle_hit with storage vexp:dungeons.weapon combo_params

# Hitted common feedback (damage hearts)
execute as @e[tag=vexp.hitted] at @s run function vexp:dungeons/combo_system/hitted_entity

# Clear pending state for this queued hit.
tag @s remove vexp.hit_delay.pending
scoreboard players set @s vexp.hit_delay 0
