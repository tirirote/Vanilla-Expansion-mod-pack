# dungeons/combo_system/tick.mcfunction
# Main Combo System Tick
# Right-click detection now handled by advancements (sword_attack, axe_attack, dagger_attack, etc)

# Hitbox Management
# Mark all hitboxes for potential removal
execute as @e[type=interaction,tag=vexp.combo_hitbox] run tag @s add vexp.hitbox.to_remove
execute as @e[type=item_display,tag=vexp.combo_hitbox_indicator] run tag @s add vexp.hitbox.to_remove

# Check if player is a valid combo user
execute as @a at @s run function vexp:dungeons/combo_system/hitbox/manage

# Manage player cooldown
execute as @a run function vexp:dungeons/combo_system/cooldown_manage

# When player is a combo user
execute as @a[tag=vexp.combo_user] at @s run function vexp:dungeons/combo_system/combo_user_tick

# 2.2 Resolve hold-release skills (ready + no longer holding).
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"axe"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"pickaxe"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"shovel"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold

# 2.3 Skill hold cleanup: clear the charge if the player was not using an axe this tick.
execute as @a[tag=!vexp.skill_hold_active] if score @s vexp.skill_hold_time matches 1.. run scoreboard players set @s vexp.skill_hold_time 0
tag @a remove vexp.skill_hold_active

# Process Hitbox Clicks
execute as @e[type=interaction,tag=vexp.combo_hitbox] run function vexp:dungeons/combo_system/hitbox/process

# Remove hitboxes that were not updated (no active owner)
execute as @e[type=interaction,tag=vexp.hitbox.to_remove] run kill @s
execute as @e[type=item_display,tag=vexp.hitbox.to_remove] run kill @s
