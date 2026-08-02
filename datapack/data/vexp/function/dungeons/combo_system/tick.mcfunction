# dungeons/combo_system/tick.mcfunction
# Main Combo System Tick
# Right-click detection now handled by advancements (sword_attack, axe_attack, dagger_attack, etc)

# Camera look
execute as @a run function vexp:dungeons/combo_system/look/update

# 0. Hitbox Management
# Mark all hitboxes for potential removal
tag @e[type=interaction,tag=vexp.combo_hitbox] add vexp.hitbox.to_remove
tag @e[type=item_display,tag=vexp.combo_hitbox_indicator] add vexp.hitbox.to_remove

# Update/Summon hitboxes for players
execute as @a at @s run function vexp:dungeons/combo_system/hitbox/manage

# Remove hitboxes that were not updated (no active owner)
kill @e[type=interaction,tag=vexp.hitbox.to_remove]
kill @e[type=item_display,tag=vexp.hitbox.to_remove]

# 1. Cooldown logic
execute as @a[scores={vexp.skill_cooldown=1..}] run function vexp:dungeons/combo_system/display_skill_cooldown
execute as @a[scores={vexp.combo_cooldown=1..}] run function vexp:dungeons/combo_system/display_combo_cooldown
execute as @a[scores={vexp.combo_cooldown=1..}] run scoreboard players remove @s vexp.combo_cooldown 1
execute as @a[scores={vexp.skill_cooldown=1..}] run scoreboard players remove @s vexp.skill_cooldown 1
execute as @a[scores={vexp.hitbox_hide_timer=1..}] run scoreboard players remove @s vexp.hitbox_hide_timer 1

# 2. Process Hitbox Clicks (only if cooldown is 0)
execute as @e[type=interaction,tag=vexp.combo_hitbox] at @s run function vexp:dungeons/combo_system/hitbox/process

# 2.1 Resolve delayed hit queue (swoosh first, hit logic after)
function vexp:dungeons/combo_system/hooks/hit/process_delayed_tick

# On swoosh custom hook (animated)
execute as @a[scores={vexp.hit_delay=1..}] at @s positioned ~ ~1.4 ~ run function vexp:dungeons/combo_system/hooks/swoosh/swoosh_wrapper

# 2.2 Resolve hold-release skills (ready + no longer holding).
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"axe"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"pickaxe"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s SelectedItem.components."minecraft:custom_data".vexp{item:"shovel"} if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s if data entity @s equipment.offhand.components."minecraft:custom_data".vexp{item:"spellbook"} unless data entity @s SelectedItem if score @s vexp.skill_hold_time matches 1.. run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold

# 2.3 Axe hold cleanup: clear the charge if the player was not using an axe this tick.
execute as @a[tag=!vexp.skill_hold_active,scores={vexp.skill_hold_time=1..}] run scoreboard players set @s vexp.skill_hold_time 0
tag @a remove vexp.skill_hold_active

# 3. Parry Logic
execute as @a[scores={vexp.parry_timer=1..}] at @s run function vexp:dungeons/combo_system/parry

# 4. Special hit window for player
execute as @a[tag=vexp.hitted.special,scores={vexp.special_hit_window=1..}] run scoreboard players remove @s vexp.special_hit_window 1
execute as @a[tag=vexp.hitted.special] if score @s vexp.special_hit_window matches 0 run tag @s remove vexp.hitted.special
