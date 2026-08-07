# dungeons/combo_system/tick.mcfunction
# Main Combo System Tick
# Right-click detection now handled by advancements (sword_attack, axe_attack, dagger_attack, etc)

# Hitbox Management
# Mark all hitboxes for potential removal
tag @e[type=interaction,tag=vexp.combo_hitbox] add vexp.hitbox.to_remove
tag @e[type=item_display,tag=vexp.combo_hitbox_indicator] add vexp.hitbox.to_remove

# Check if player is a valid combo user
execute as @a at @s run function vexp:dungeons/combo_system/hitbox/manage

# Manage player cooldown
execute as @a run function vexp:dungeons/combo_system/cooldown_manage

# When player is a combo user
execute as @a[tag=vexp.combo_user] at @s run function vexp:dungeons/combo_system/combo_user_tick

# Process Hitbox Clicks
execute as @e[type=interaction,tag=vexp.combo_hitbox] run function vexp:dungeons/combo_system/hitbox/process

# Remove hitboxes that were not updated (no active owner)
kill @e[type=interaction,tag=vexp.hitbox.to_remove]
kill @e[type=item_display,tag=vexp.hitbox.to_remove]
