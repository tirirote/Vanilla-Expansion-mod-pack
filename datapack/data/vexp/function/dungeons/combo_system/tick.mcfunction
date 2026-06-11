# dungeons/combo_system/tick.mcfunction
# Main Combo System Tick
# Right-click detection now handled by advancements (sword_attack, axe_attack, dagger_attack, etc)

# Camera look speed snapshot for combo users (used by swoosh scaling)
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
execute as @a[scores={vexp.combo_cooldown=1..}] run scoreboard players remove @s vexp.combo_cooldown 1
execute as @a[scores={vexp.skill_cooldown=1..}] run scoreboard players remove @s vexp.skill_cooldown 1
execute as @a[scores={vexp.hitbox_hide_timer=1..}] run scoreboard players remove @s vexp.hitbox_hide_timer 1

# 2. Process Hitbox Clicks (only if cooldown is 0)
execute as @e[type=interaction,tag=vexp.combo_hitbox] at @s run function vexp:dungeons/combo_system/hitbox/process

# 2.1 Resolve delayed hit queue (swoosh first, hit logic after)
function vexp:dungeons/combo_system/hooks/hit/process_delayed_tick

# 2.2 Resolve hold-release skills (ready + no longer holding).
execute as @a[tag=vexp.skill_hold_ready,tag=!vexp.skill_hold_active] at @s run function vexp:dungeons/combo_system/hooks/interact/resolve_right_click_hold

# 2.3 Axe hold cleanup: clear the charge if the player was not using an axe this tick.
execute as @a[tag=!vexp.skill_hold_active,scores={vexp.skill_hold_time=1..}] run scoreboard players set @s vexp.skill_hold_time 0
tag @a remove vexp.skill_hold_active

#3. Parry Logic
execute as @a[scores={vexp.parry_timer=1..}] at @s run function vexp:dungeons/combo_system/parry
