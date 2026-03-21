# dungeons/combo_system/tick.mcfunction
# Main Combo System Tick
# Right-click detection now handled by advancements (sword_attack, axe_attack, dagger_attack, etc)

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
