# dungeons/combo_system/hitbox/found_it.mcfunction

# @s is the hitbox
# @p is the player

tag @s remove vexp.hitbox.to_remove
tag @p[tag=vexp.combo_user,limit=1,sort=nearest] add vexp.hitbox.found
