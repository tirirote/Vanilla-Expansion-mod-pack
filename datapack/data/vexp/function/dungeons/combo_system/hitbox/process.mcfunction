# dungeons/combo_system/hitbox/process.mcfunction

# Ready flag comes from hitbox-local cooldown snapshot (synced in hitbox/update_pos).
execute if score @s vexp.combo_cooldown matches 0 run tag @s add vexp.hitbox.ready

# If HIT (Attack) and NO COOLDOWN
execute as @s[tag=vexp.hitbox.ready] if data entity @s attack at @s run function vexp:dungeons/combo_system/hitbox/on_attack

# If INTERACTION (Right Click) and NO COOLDOWN.
# Attack has priority when both flags are present in the same tick.
execute as @s[tag=vexp.hitbox.ready] if data entity @s interaction at @s run function vexp:dungeons/combo_system/hitbox/on_interact

# Reset interaction data (always)
data remove entity @s attack
data remove entity @s interaction

# Note: Hitbox cleanup is handled globally in tick.mcfunction + manage/update
tag @s remove vexp.hitbox.ready
