# dungeons/combo_system/hitbox/summon.mcfunction
# @s is the player

# Summon the interaction entity
# Smaller box avoids overlapping with interactable blocks (chests, etc.) that are close to the player.
# mine_temp is added here so update_pos can position and mirror cooldown on the very first tick.
summon interaction ^ ^0.4 ^0.25 {Tags:["vexp.combo_hitbox", "vexp.hitbox.new", "vexp.hitbox.mine_temp"], width:0.8f, height:0.8f, response:true}

#Hit Indicator diagonal -> left_rotation:[0.707f,0.303f,0.303f,0.707f]
summon item_display ^ ^0.65 ^0.5 {Tags:["vexp.combo_hitbox_indicator", "vexp.hitbox_indicator.new"],item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_model_data":{strings:["vexp:hit_indicator_candidate"]}}},transformation:{left_rotation:[0.707f,0f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.3f,0.3f,0.3f]},brightness:{block:15,sky:15},teleport_duration:2,interpolation_duration:1,view_range:1.0f,glow_color_override:-1,Glowing:true}

# Assign the same ID as the player.
# Direct entity-to-entity score copy (no shared holder): @s is still the player here
# since summon.mcfunction is entered via a plain function call, not "execute as".
scoreboard players operation @e[tag=vexp.hitbox.new,sort=nearest,limit=1] vexp.id = @s vexp.id
scoreboard players operation @e[tag=vexp.hitbox_indicator.new,sort=nearest,limit=1] vexp.id = @s vexp.id

data modify entity @e[type=item_display,tag=vexp.hitbox_indicator.new,tag=!vexp.hitbox.to_remove,sort=nearest,limit=1] Rotation set from entity @s Rotation

# Clean tag and mark player as found
tag @e[tag=vexp.hitbox.new,sort=nearest,limit=1] remove vexp.hitbox.new
tag @e[tag=vexp.hitbox_indicator.new,sort=nearest,limit=1] remove vexp.hitbox_indicator.new

tag @s add vexp.hitbox.found
