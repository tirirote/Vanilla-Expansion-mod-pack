# dungeons/combo_system/hitbox/summon.mcfunction
# @s is the player

# Summon the interaction entity
# Smaller box avoids overlapping with interactable blocks (chests, etc.) that are close to the player.
# mine_temp is added here so update_pos can position and mirror cooldown on the very first tick.
summon interaction ~ ~ ~ {Tags:["vexp.combo_hitbox", "vexp.hitbox.new", "vexp.hitbox.mine_temp"], width:0.8f, height:1f, response:true}

#Hit Indicator diagonal -> left_rotation:[0.707f,0.303f,0.303f,0.707f]
summon item_display ~ ~0.65 ~ {Tags:["vexp.combo_hitbox_indicator", "vexp.hitbox_indicator.new"],item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_model_data":{strings:["vexp:hit_indicator_candidate"]}}},transformation:{left_rotation:[0.707f,0f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.8f,0.8f,0.8f]},brightness:{block:15,sky:15},teleport_duration:2,interpolation_duration:2,view_range:1.0f,glow_color_override:-1,Glowing:true}

# Assign the same ID as the player.
# Use #combo_owner_id (set by evaluate_summon before calling summon) instead of @p sort=nearest
# to avoid the fragile nearest-player selector inside an execute as @e context.
execute as @e[tag=vexp.hitbox.new,limit=1] run scoreboard players operation @s vexp.id = #combo_owner_id vexp.id
execute as @e[tag=vexp.hitbox_indicator.new] run scoreboard players operation @s vexp.id = #combo_owner_id vexp.id

data modify entity @e[type=item_display,tag=vexp.hitbox_indicator.new,tag=!vexp.hitbox.to_remove,limit=1,sort=nearest] Rotation set from entity @s Rotation

# Clean tag and mark player as found
tag @e[tag=vexp.hitbox.new] remove vexp.hitbox.new
tag @e[tag=vexp.hitbox_indicator.new] remove vexp.hitbox_indicator.new

tag @s add vexp.hitbox.found
