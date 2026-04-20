# dungeons/combo_system/hitbox/summon.mcfunction
# @s is the player

# Summon the interaction entity
# Smaller box avoids overlapping with interactable blocks (chests, etc.) that are close to the player.
# mine_temp is added here so update_pos can position and mirror cooldown on the very first tick.
summon interaction ~ ~ ~ {Tags:["vexp.combo_hitbox", "vexp.hitbox.new", "vexp.hitbox.mine_temp"], width:0.8f, height:1f}

# Assign the same ID as the player.
# Use #combo_owner_id (set by evaluate_summon before calling summon) instead of @p sort=nearest
# to avoid the fragile nearest-player selector inside an execute as @e context.
execute as @e[tag=vexp.hitbox.new,limit=1] run scoreboard players operation @s vexp.id = #combo_owner_id vexp.id

# Clean tag and mark player as found
tag @e[tag=vexp.hitbox.new] remove vexp.hitbox.new
tag @s add vexp.hitbox.found
tag @s add vexp.hitbox.found
