# dungeons/combo_system/tick.mcfunction
# Main Combo System Tick
# Right-click detection now handled by advancements (sword_attack, axe_attack, dagger_attack, etc)

# Camera look speed snapshot for combo users (used by swoosh scaling)
execute as @a run function vexp:dungeons/combo_system/look/update

# 0. Hitbox Management
# Mark all hitboxes for potential removal
tag @e[type=interaction,tag=vexp.combo_hitbox] add vexp.hitbox.to_remove
# Update/Summon hitboxes for players
execute as @a run function vexp:dungeons/combo_system/hitbox/manage
# Remove hitboxes that were not updated (no active owner)
kill @e[type=interaction,tag=vexp.hitbox.to_remove]

# 1. Cooldown logic
execute as @a[scores={vexp.combo_cooldown=1..}] run scoreboard players remove @s vexp.combo_cooldown 1

# 2. Process Hitbox Clicks (only if cooldown is 0)
execute as @e[type=interaction,tag=vexp.combo_hitbox] at @s run function vexp:dungeons/combo_system/hitbox/process

# 3. Generate trails only during the 10-tick hit window
execute as @a[tag=vexp.combo_user,scores={vexp.swoosh_ticks=1..}] at @s positioned ^ ^ ^2.5 run function vexp:dungeons/combo_system/hooks/on_swoosh

# 4. Decrease swoosh window
execute as @a[scores={vexp.swoosh_ticks=1..}] run scoreboard players remove @s vexp.swoosh_ticks 1
