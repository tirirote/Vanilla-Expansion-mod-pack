# dungeons/combo_system/hitbox/evaluate_summon.mcfunction
# @s is the player (attacker)
# Macro receives $(reach) and $(range)

tag @s remove vexp.target_found

# Cache owner ID for self-filter in target queries.
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id
scoreboard players set #combo_target_found vexp.math 0

# Evaluamos si hay un objetivo válido para marcar 'target_found'
$execute positioned ^ ^ ^$(reach) as @e[predicate=vexp:is_target,distance=..$(range)] unless score @s vexp.id = #combo_owner_id vexp.id run scoreboard players set #combo_target_found vexp.math 1
execute if score #combo_target_found vexp.math matches 1.. run tag @s add vexp.target_found

# Si no hay objetivo, salimos. La hitbox existente morirá naturalmente en este tick.
# Esto libera la interacción con bloques (cofres, botones) y con el aire.
execute unless entity @s[tag=vexp.target_found] run return fail

# -------------- CORE LOGIC (Solo si estamos mirando a un Mob candidato (cumple el predicado "vexp:is_target")) -------------- #

# Search for EXACTLY one hitbox with my ID.
tag @s remove vexp.hitbox.found

# Cache owner ID before switching context inside execute as @e.
# Using @p inside that block would resolve to the nearest player to the hitbox,
# which is wrong in multiplayer (another player's hitbox could match).
execute as @e[type=interaction,tag=vexp.combo_hitbox,distance=..25] if score @s vexp.id = #combo_owner_id vexp.id run tag @s add vexp.hitbox.mine_temp
execute as @e[type=item_display,tag=vexp.combo_hitbox_indicator,distance=..25] if score @s vexp.id = #combo_owner_id vexp.id run tag @s add vexp.hitbox.mine_temp

# Relay cooldown state to the hitbox
execute as @e[tag=vexp.hitbox.mine_temp] run tag @s remove vexp.hitbox.cooldown
execute if score @s vexp.combo_cooldown matches 1.. as @e[tag=vexp.hitbox.mine_temp] run tag @s add vexp.hitbox.cooldown

# Check surviving hitbox to unmark it from death
execute at @s as @e[type=interaction,tag=vexp.hitbox.mine_temp,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/check_reach
execute at @s as @e[type=item_display,tag=vexp.combo_hitbox_indicator,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/check_reach

# If not found (destroyed or new held item), summon exactly one
$execute unless entity @s[tag=vexp.hitbox.found] positioned ^ ^ ^$(reach) run function vexp:dungeons/combo_system/hitbox/summon

# Reposition the one we picked (must be the one without to_remove or newest)

#1. If holding spellbook in offhand, use spellbook data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run function vexp:dungeons/combo_system/hitbox/update_pos with entity @s equipment.offhand.components."minecraft:custom_data".vexp.combo
#2. If holding spellbook in offhand, and other thing in mainhand, use mainhand data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run function vexp:dungeons/combo_system/hitbox/update_pos with entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
# 3. If not spellbook in offhand, use mainhand data
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run function vexp:dungeons/combo_system/hitbox/update_pos with entity @s SelectedItem.components."minecraft:custom_data".vexp.combo

function vexp:dungeons/combo_system/hitbox/update_hitmark

# Cleanup temp tags for this player (next player starts clean)
tag @e[tag=vexp.hitbox.mine_temp] remove vexp.hitbox.mine_temp
