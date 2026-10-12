# Item spin feedback

# Tag Player
tag @s add vexp.artifact_owner
scoreboard players operation #artifact_owner_id vexp.math = @s vexp.id

# Summon artifact display
execute positioned ~ ~1.5 ~ run summon item_display ^ ^ ^1.5 {Tags:["vexp.artifact_item_spin","vexp.artifact_item_spin.new","vexp.artifact_item_spin_front"],item:{id:"minecraft:stone",count:1},transformation:{left_rotation:[0.707f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:4,view_range:1.0f,billboard:"center"}

execute positioned ~ ~1.5 ~ run summon item_display ^ ^ ^-1.5 {Tags:["vexp.artifact_item_spin","vexp.artifact_item_spin.new","vexp.artifact_item_spin_back"],item:{id:"minecraft:stone",count:1},transformation:{left_rotation:[0.707f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:4,view_range:1.0f,billboard:"center"}

# Update item display. (front)
execute if items entity @s weapon.offhand totem_of_undying run data modify entity @e[type=item_display,tag=vexp.artifact_item_spin_front,sort=nearest,limit=1,distance=..3.5] item set from entity @s equipment.offhand
execute if items entity @s weapon.mainhand totem_of_undying run data modify entity @e[type=item_display,tag=vexp.artifact_item_spin_front,sort=nearest,limit=1,distance=..3.5] item set from entity @s SelectedItem

# Update item display. (back)
execute if items entity @s weapon.offhand totem_of_undying run data modify entity @e[type=item_display,tag=vexp.artifact_item_spin_back,sort=nearest,limit=1,distance=..3.5] item set from entity @s equipment.offhand
execute if items entity @s weapon.mainhand totem_of_undying run data modify entity @e[type=item_display,tag=vexp.artifact_item_spin_back,sort=nearest,limit=1,distance=..3.5] item set from entity @s SelectedItem

# Link owner id
execute as @e[type=item_display,tag=vexp.artifact_item_spin.new,sort=nearest,limit=2,distance=..3.5] run scoreboard players operation @s vexp.id = #artifact_owner_id vexp.math

# Set Anim Frames
scoreboard players set @e[type=item_display,tag=vexp.artifact_item_spin.new,sort=nearest,limit=2,distance=..3.5] vexp.anim_frame 32
tag @e[type=item_display,tag=vexp.artifact_item_spin.new,sort=nearest,limit=2,distance=..3.5] remove vexp.artifact_item_spin.new

tag @s remove vexp.artifact_owner
