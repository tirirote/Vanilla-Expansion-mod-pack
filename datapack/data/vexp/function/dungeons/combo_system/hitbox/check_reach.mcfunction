# dungeons/combo_system/hitbox/check_reach.mcfunction
# @s is the hitbox, @p is the player

# Unmark from global removal
tag @s remove vexp.hitbox.to_remove

# If hitbox survived, mark player as "found hitbox"
execute if entity @s run tag @p[limit=1,sort=nearest] add vexp.hitbox.found
