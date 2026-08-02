# dungeons/combo_system/hooks/hit/handle_hit.mcfunction
# @s is the player

# On hit weapons hooks
function vexp:dungeons/combo_system/hooks/hit/route_on_hit with storage vexp:dungeons.weapon combo_params

# Durability management
function vexp:dungeons/combo_system/hooks/damage_mainhand_durability
function vexp:dungeons/combo_system/hooks/damage_offhand_durability

# Mark impacted entities from this hit as critical for indicator customization.
execute if entity @s[tag=vexp.hit_critical] as @e[tag=vexp.hitted] at @s run function vexp:dungeons/combo_system/hooks/hit/handle_crit_hit

# Route to combo logic based on item type (adds vexp.combo_end if reached limit)
execute if items entity @s weapon.offhand *[custom_data~{vexp:{type:"short_combo"}}] unless data entity @s SelectedItem run function vexp:dungeons/combo_system/combos/process_short
execute if items entity @s weapon.offhand *[custom_data~{vexp:{type:"mid_combo"}}] unless data entity @s SelectedItem run function vexp:dungeons/combo_system/combos/process_mid
execute if items entity @s weapon.offhand *[custom_data~{vexp:{type:"long_combo"}}] unless data entity @s SelectedItem run function vexp:dungeons/combo_system/combos/process_long

# Route to combo logic based on item type (adds vexp.combo_end if reached limit)
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"short_combo"}}] run function vexp:dungeons/combo_system/combos/process_short
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"mid_combo"}}] run function vexp:dungeons/combo_system/combos/process_mid
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"long_combo"}}] run function vexp:dungeons/combo_system/combos/process_long

# Trigger end combo immediately if tagged (Combo finisher)
execute if entity @s[tag=vexp.combo_end] run function vexp:dungeons/combo_system/hooks/combo/end_combo with storage vexp:dungeons.weapon combo_params

# Spawn damage indicators after combo state has been finalized for this hit
execute as @e[tag=vexp.hitted] at @s run function vexp:mob_health/spawn_damage_on_hit

# Special hit window for player
scoreboard players set #extra_window_ticks vexp.math 18
execute store result score #special_hit_window_ticks vexp.math run data get storage vexp:dungeons.weapon combo_params.cooldown 1
scoreboard players operation #special_hit_window_ticks vexp.math += #extra_window_ticks vexp.math
execute if entity @s[tag=vexp.hitted.special] store result score @s vexp.special_hit_window run scoreboard players get #special_hit_window_ticks vexp.math
