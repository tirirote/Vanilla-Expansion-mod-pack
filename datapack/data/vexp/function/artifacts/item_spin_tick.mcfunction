# Manage Lifetime
scoreboard players remove @s vexp.anim_frame 1
execute if score @s vexp.anim_frame matches ..1 run kill @s

# Tp to owner with offset

execute as @a[distance=..48] if score @s vexp.id = @e[tag=vexp.artifact_item_spin_front,limit=1,sort=nearest,distance=..16] vexp.id at @s run tp @e[tag=vexp.artifact_item_spin_front,limit=1,sort=nearest,distance=..16] ^ ^1.4 ^1.5

execute as @a[distance=..48] if score @s vexp.id = @e[tag=vexp.artifact_item_spin_back,limit=1,sort=nearest,distance=..16] vexp.id at @s run tp @e[tag=vexp.artifact_item_spin_back,limit=1,sort=nearest,distance=..16] ^ ^1.4 ^-1.5

# Keyframes
# Rot
execute if score @s vexp.anim_frame matches 28..32 run data modify entity @s transformation.left_rotation set value [0f,0f,0f,1f]
execute if score @s vexp.anim_frame matches 24..28 run data modify entity @s transformation.left_rotation set value [0f,0.5f,0f,0.5f]
execute if score @s vexp.anim_frame matches 20..24 run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]
execute if score @s vexp.anim_frame matches 16..20 run data modify entity @s transformation.left_rotation set value [0f,-0.5f,0f,0.5f]
execute if score @s vexp.anim_frame matches 12..16 run data modify entity @s transformation.left_rotation set value [0f,0f,0f,1f]
execute if score @s vexp.anim_frame matches 8..12 run data modify entity @s transformation.left_rotation set value [0f,0.5f,0f,0.5f]
execute if score @s vexp.anim_frame matches ..8 run data modify entity @s transformation.left_rotation set value [0f,1f,0f,0f]

# Scale
execute if score @s vexp.anim_frame matches 28..32 run data modify entity @s transformation.scale set value [0f,0f,0f]
execute if score @s vexp.anim_frame matches 12..28 run data modify entity @s transformation.scale set value [1f,1f,1f]
execute if score @s vexp.anim_frame matches ..8 run data modify entity @s transformation.scale set value [0f,0f,0f]
