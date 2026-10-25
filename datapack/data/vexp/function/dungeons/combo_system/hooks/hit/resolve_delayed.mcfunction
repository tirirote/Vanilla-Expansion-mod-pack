# dungeons/combo_system/hooks/hit/resolve_delayed.mcfunction
# @s is the player

# Refresh combo params using the same weapon selection policy as live hit/interact flow.
function vexp:dungeons/combo_system/update_storage

# Recompute effect-adjusted params for delayed damage application.
function vexp:dungeons/combo_system/hooks/compute_effects

# Mark attacker and detect critical state at the delayed resolution frame.
tag @s add vexp.attacker

# Resolve damage and post-hit hooks.
function vexp:dungeons/combo_system/hooks/hit/tag_hitted with storage vexp:dungeons.weapon combo_params
execute as @e[tag=vexp.hitted] run scoreboard players set @s vexp.hit_success 0

# Feedback when hit missed
function vexp:dungeons/combo_system/hooks/hit/handle_missed_hit with storage vexp:dungeons.weapon combo_params

# Process other hooks before applying damage
function vexp:dungeons/armor/on_hit
function vexp:dungeons/enchantments/post_attack_combo

# Resolve Damage
function vexp:dungeons/combo_system/hitbox/resolve_eff_damage with storage vexp:dungeons.weapon combo_params

function vexp:dungeons/combo_system/hooks/hit/handle_hit with storage vexp:dungeons.weapon combo_params

# Hitted common feedback (damage hearts)
execute as @e[tag=vexp.hitted] at @s run particle minecraft:damage_indicator ~ ~1 ~ .35 .35 .35 0.1 3

# Change swing animation
execute store result score #random_whack_anim vexp.math run random value 0..1
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_whack_anim vexp.math matches 0 run item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"swing_animation":{type:"stab"}}}
execute unless data storage vexp:dungeons.weapon combo_params{item:"spellbook"} if score #random_whack_anim vexp.math matches 1 run item modify entity @s weapon.mainhand {"function":"minecraft:set_components","components":{"swing_animation":{type:"whack"}}}

# Clear pending state for this queued hit.
tag @s remove vexp.hit_delay.pending
scoreboard players set @s vexp.hit_delay 0
