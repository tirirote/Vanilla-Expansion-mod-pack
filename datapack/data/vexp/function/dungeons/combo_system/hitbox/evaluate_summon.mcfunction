# dungeons/combo_system/hitbox/evaluate_summon.mcfunction
# @s is the player (attacker)
# Macro receives $(reach) and $(range)

tag @s remove vexp.target_found

# Evaluamos si hay un objetivo válido para marcar 'target_found'
$execute positioned ^ ^ ^$(reach) if entity @e[predicate=vexp:is_target,distance=..$(range)] run tag @s add vexp.target_found

# Si no hay objetivo, salimos. La hitbox existente morirá naturalmente en este tick.
# Esto libera la interacción con bloques (cofres, botones) y con el aire.
execute unless entity @s[tag=vexp.target_found] run return 0

# -------------- CORE LOGIC (Solo si estamos mirando a un Mobj) -------------- #

# Search for EXACTLY one hitbox with my ID.
tag @s remove vexp.hitbox.found
# Cache owner ID before switching context inside execute as @e.
# Using @p inside that block would resolve to the nearest player to the hitbox,
# which is wrong in multiplayer (another player's hitbox could match).
scoreboard players operation #combo_owner_id vexp.id = @s vexp.id
execute as @e[type=interaction,tag=vexp.combo_hitbox,distance=..25] if score @s vexp.id = #combo_owner_id vexp.id run tag @s add vexp.hitbox.mine_temp
# Relay cooldown state to the hitbox
execute as @e[tag=vexp.hitbox.mine_temp] run tag @s remove vexp.hitbox.cooldown
execute if score @s vexp.combo_cooldown matches 1.. as @e[tag=vexp.hitbox.mine_temp] run tag @s add vexp.hitbox.cooldown

# Check surviving hitbox to unmark it from death
execute at @s as @e[type=interaction,tag=vexp.hitbox.mine_temp,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/check_reach with storage vexp:dungeons.weapon combo_params

# If not found (destroyed or new held item), summon exactly one
execute unless entity @s[tag=vexp.hitbox.found] run function vexp:dungeons/combo_system/hitbox/summon

# Reposition the one we picked (must be the one without to_remove or newest)
function vexp:dungeons/combo_system/hitbox/update_pos with storage vexp:dungeons.weapon combo_params

# Cleanup temp tags for this player (next player starts clean)
tag @e[tag=vexp.hitbox.mine_temp] remove vexp.hitbox.mine_temp
