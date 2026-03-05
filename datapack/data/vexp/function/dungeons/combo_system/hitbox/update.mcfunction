# dungeons/combo_system/hitbox/update.mcfunction

# Update local storage with current item combo data
data modify storage vexp:main combo_params set from entity @s SelectedItem.components."minecraft:custom_data".vexp.combo

# Also copy the 'item' identifier for our hooks
data modify storage vexp:main combo_params.item set from entity @s SelectedItem.components."minecraft:custom_data".vexp.item

# Search for EXACTLY one hitbox with my ID.
tag @s remove vexp.hitbox.found
# Tag any hitbox with the same ID as as "mine_temp"
execute as @e[type=interaction,tag=vexp.combo_hitbox,distance=..25] if score @s vexp.id = @p vexp.id run tag @s add vexp.hitbox.mine_temp

# Among those hitboxes tagged as mine, only the nearest one is chosen.
# This ensures that even if somehow two exist, we only keep and update one.
execute at @s as @e[type=interaction,tag=vexp.hitbox.mine_temp,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/check_reach with storage vexp:main combo_params

# If not found (destroyed or new held item), summon exactly one
execute unless entity @s[tag=vexp.hitbox.found] run function vexp:dungeons/combo_system/hitbox/summon

# Reposition the one we picked (must be the one without to_remove or newest)
execute at @s as @e[type=interaction,tag=vexp.combo_hitbox,tag=vexp.hitbox.mine_temp,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] run function vexp:dungeons/combo_system/hitbox/update_pos with storage vexp:main combo_params

# Cleanup temp tags for this player (next player starts clean)
tag @e[tag=vexp.hitbox.mine_temp] remove vexp.hitbox.mine_temp
