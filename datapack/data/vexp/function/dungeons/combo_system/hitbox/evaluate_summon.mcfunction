# dungeons/combo_system/hitbox/evaluate_summon.mcfunction
# @s is the player (attacker)
# Macro receives $(reach) and $(range)

tag @s remove vexp.target_found

# Wide-range target scan (arbitrary distance, not a nearest-neighbor lookup): exclude
# myself via a per-entity tag instead of a shared holder, since here there can be
# several candidates and no single "nearest" one is guaranteed to be me.
tag @s add vexp.combo_self

# Evaluamos si hay un objetivo válido para marcar 'target_found'
$execute positioned ^ ^ ^-1 positioned ^ ^ ^$(reach) if entity @e[predicate=vexp:is_target,tag=!vexp.combo_self,distance=..$(range)] run tag @s add vexp.target_found

tag @s remove vexp.combo_self

# Si no hay objetivo, salimos. La hitbox existente morirá naturalmente en este tick.
# Esto libera la interacción con bloques (cofres, botones) y con el aire.
execute unless entity @s[tag=vexp.target_found] run return fail

# -------------- CORE LOGIC (Solo si estamos mirando a un Mob candidato (cumple el predicado "vexp:is_target")) -------------- #

# Search for EXACTLY one hitbox with my ID.
tag @s remove vexp.hitbox.found

# My own hitbox/indicator always sit within a few blocks in front of me, so the nearest
# match is mine — confirmed by an exact id comparison directly against that entity's
# own score. No shared holder: both selectors resolve deterministically in the same command.
execute if score @s vexp.id = @e[type=interaction,tag=vexp.combo_hitbox,distance=..2,sort=nearest,limit=1] vexp.id run tag @s add vexp.hitbox.found
execute if score @s vexp.id = @e[type=interaction,tag=vexp.combo_hitbox,distance=..2,sort=nearest,limit=1] vexp.id as @e[type=interaction,tag=vexp.combo_hitbox,distance=..2,sort=nearest,limit=1] run tag @s remove vexp.hitbox.to_remove
execute if score @s vexp.id = @e[type=interaction,tag=vexp.combo_hitbox,distance=..2,sort=nearest,limit=1] vexp.id as @e[type=interaction,tag=vexp.combo_hitbox,distance=..2,sort=nearest,limit=1] run tag @s add vexp.hitbox.mine_temp

# Indicator now sits right next to the hitbox (update_hitmark.mcfunction), so the same
# tight radius as the hitbox is enough — both @e mentions must match or "as" could
# switch to a different entity than the one just verified by id.
#execute if score @s vexp.id = @e[type=item_display,tag=vexp.combo_hitbox_indicator,distance=..2,sort=nearest,limit=1] vexp.id as @e[type=item_display,tag=vexp.combo_hitbox_indicator,distance=..2,sort=nearest,limit=1] run tag @s remove vexp.hitbox.to_remove
#execute if score @s vexp.id = @e[type=item_display,tag=vexp.combo_hitbox_indicator,distance=..2,sort=nearest,limit=1] vexp.id as @e[type=item_display,tag=vexp.combo_hitbox_indicator,distance=..2,sort=nearest,limit=1] run tag @s add vexp.hitbox.mine_temp

# Relay cooldown state to the hitbox
execute as @e[tag=vexp.hitbox.mine_temp] run tag @s remove vexp.hitbox.cooldown
execute if score @s vexp.combo_cooldown matches 1.. as @e[tag=vexp.hitbox.mine_temp] run tag @s add vexp.hitbox.cooldown

# If not found (destroyed or new held item), summon exactly one
execute unless entity @s[tag=vexp.hitbox.found] run function vexp:dungeons/combo_system/hitbox/summon

# Hitbox reposition the one we picked (must be the one without to_remove or newest)
#1. If holding spellbook in offhand, use spellbook data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem run function vexp:dungeons/combo_system/hitbox/update_pos with entity @s equipment.offhand.components."minecraft:custom_data".vexp.combo
#2. If holding spellbook in offhand, and other thing in mainhand, use mainhand data
execute if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} if data entity @s SelectedItem run function vexp:dungeons/combo_system/hitbox/update_pos with entity @s SelectedItem.components."minecraft:custom_data".vexp.combo
# 3. If not spellbook in offhand, use mainhand data
execute unless data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} run function vexp:dungeons/combo_system/hitbox/update_pos with entity @s SelectedItem.components."minecraft:custom_data".vexp.combo

# Update Indicator
#function vexp:dungeons/combo_system/hitbox/update_hitmark

# Cleanup temp tags for this player (next player starts clean)
tag @e[tag=vexp.hitbox.mine_temp] remove vexp.hitbox.mine_temp
