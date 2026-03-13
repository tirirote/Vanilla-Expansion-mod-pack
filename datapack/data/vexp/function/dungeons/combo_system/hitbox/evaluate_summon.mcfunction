# dungeons/combo_system/hitbox/evaluate_summon.mcfunction
# @s is the player (attacker)
# Macro receives $(reach) and $(range)

tag @s remove vexp.target_found

# Evaluamos si hay un objetivo válido para marcar 'target_found'
$execute anchored eyes positioned ^ ^ ^1.2 if entity @e[type=!#minecraft:arrows,type=!text_display,type=!armor_stand,type=!item_display,type=!block_display,type=!interaction,type=!item_frame,type=!glow_item_frame,type=!experience_orb,type=!marker,type=!area_effect_cloud,type=!item,type=!player,distance=..$(reach)] run tag @s add vexp.target_found

# Si no hay objetivo, salimos. La hitbox existente morirá naturalmente en este tick.
# Esto libera la interacción con bloques (cofres, botones) y con el aire.
execute unless entity @s[tag=vexp.target_found] run return 0

# -------------- CORE LOGIC (Solo si estamos mirando a un Mobj) -------------- #

# Search for EXACTLY one hitbox with my ID.
tag @s remove vexp.hitbox.found
# Tag any hitbox with the same ID as as "mine_temp"
execute as @e[type=interaction,tag=vexp.combo_hitbox,distance=..25] if score @s vexp.id = @p vexp.id run tag @s add vexp.hitbox.mine_temp

# Relay cooldown state to the hitbox
execute as @e[tag=vexp.hitbox.mine_temp] run tag @s remove vexp.hitbox.cooldown
execute if score @s vexp.combo_cooldown matches 1.. as @e[tag=vexp.hitbox.mine_temp] run tag @s add vexp.hitbox.cooldown

# Check surviving hitbox to unmark it from death
execute at @s as @e[type=interaction,tag=vexp.hitbox.mine_temp,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/check_reach with storage vexp:main combo_params

# If not found (destroyed or new held item), summon exactly one
execute unless entity @s[tag=vexp.hitbox.found] run function vexp:dungeons/combo_system/hitbox/summon

# Reposition the one we picked (must be the one without to_remove or newest)
execute at @s as @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/update_pos with storage vexp:main combo_params

# Cleanup temp tags for this player (next player starts clean)
tag @e[tag=vexp.hitbox.mine_temp] remove vexp.hitbox.mine_temp
