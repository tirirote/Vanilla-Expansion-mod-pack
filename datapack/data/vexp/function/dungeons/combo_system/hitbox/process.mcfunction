# dungeons/combo_system/hitbox/process.mcfunction

# Only process if owner has 0 cooldown
# We find the owner (player with same ID) and check their scoreboard
execute as @s run function vexp:dungeons/combo_system/hitbox/check_cooldown

# If HIT (Attack) and NO COOLDOWN
execute as @s[tag=vexp.hitbox.ready] if data entity @s attack at @s run function vexp:dungeons/combo_system/hitbox/on_attack

# If INTERACTION (Right Click) and NO COOLDOWN
execute as @s[tag=vexp.hitbox.ready] if data entity @s interaction at @s run function vexp:dungeons/combo_system/hitbox/on_interact

# Reset interaction data (always)
data remove entity @s attack
data remove entity @s interaction

# Note: Hitbox cleanup is handled globally in tick.mcfunction + manage/update
tag @s remove vexp.hitbox.ready