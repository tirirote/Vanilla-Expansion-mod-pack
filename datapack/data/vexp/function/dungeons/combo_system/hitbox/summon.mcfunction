# dungeons/combo_system/hitbox/summon.mcfunction
# @s is the player

# Summon the interaction entity
summon interaction ~ ~ ~ {Tags:["vexp.combo_hitbox", "vexp.hitbox.new"], width:2.5f, height:2.5f}

# Assign the same ID as the player
execute as @e[tag=vexp.hitbox.new,limit=1] run scoreboard players operation @s vexp.id = @p[tag=vexp.combo_user,limit=1,sort=nearest] vexp.id

# Clean tag and mark player as found
tag @e[tag=vexp.hitbox.new] remove vexp.hitbox.new
tag @s add vexp.hitbox.found
