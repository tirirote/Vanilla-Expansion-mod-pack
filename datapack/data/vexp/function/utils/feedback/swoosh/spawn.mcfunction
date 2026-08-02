# utils/feedback/swoosh/spawn.mcfunction
# @s is the hit mob (vexp.hitted), at @s = mob's position.
# Params: $(model), $(face_player), $(scale), $(random_pos), $(lifetime), $(follow_owner), $(follow_offset_x), $(follow_offset_y), $(follow_offset_z)
# random_pos is a jitter multiplier (same style as projectile randomness strength).

# Capture attacker ID once via score — avoids a temp player tag (and the stale-tag bug
# that would occur if tag @s remove ran on the mob instead of the player).
scoreboard players operation #swoosh_owner_id vexp.math = @p[tag=vexp.attacker,limit=1] vexp.id
$scoreboard players set #swoosh_face vexp.math $(face_player)

# Spawn item_display (visual) and armor_stand (dynamic light).
# face_player=1 keeps current behavior (spawn facing attacker), face_player=0 spawns fixed.
$execute if score #swoosh_face vexp.math matches 1.. facing entity @p[tag=vexp.attacker,limit=1] eyes run summon item_display ~ ~ ~ {Tags:["vexp.swoosh","vexp.swoosh.new"],item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_model_data":{strings:["$(model)"]}}},transformation:{left_rotation:[-0.303f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.25f,0.5f],scale:[1f,1f,1f]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:2,view_range:2.0f}

#Face player = 0
$execute if score #swoosh_face vexp.math matches ..0 run summon item_display ~ ~ ~ {Tags:["vexp.swoosh","vexp.swoosh.new"],item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_model_data":{strings:["$(model)"]}}},transformation:{left_rotation:[0f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:2,view_range:2.0f}

execute if score #swoosh_face vexp.math matches 1.. facing entity @p[tag=vexp.attacker,limit=1] eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["vexp.swoosh_light","vexp.swoosh_light.new"],Marker:1b,Small:1b,Invisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Fire:32767s,HasVisualFire:1b}
execute if score #swoosh_face vexp.math matches ..0 run summon minecraft:armor_stand ~ ~ ~ {Tags:["vexp.swoosh_light","vexp.swoosh_light.new"],Marker:1b,Small:1b,Invisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Fire:32767s,HasVisualFire:1b}

# Store payload metadata in the new swoosh entity and initialize scaled spawn transform.
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.face_player set value $(face_player)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.random_pos set value $(random_pos)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.scale set value $(scale)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.lifetime set value $(lifetime)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_owner set value $(follow_owner)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_offset.x set value $(follow_offset_x)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_offset.y set value $(follow_offset_y)
$execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_offset.z set value $(follow_offset_z)
$execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_owner set value $(follow_owner)
$execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_offset.x set value $(follow_offset_x)
$execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_offset.y set value $(follow_offset_y)
$execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run data modify entity @s data.swoosh.follow_offset.z set value $(follow_offset_z)
execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run function vexp:utils/feedback/swoosh/init_scale
execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run function vexp:utils/feedback/swoosh/apply_random_position

# Link both entities to the attacker and initialise animation state.
execute if score #swoosh_face vexp.math matches 1.. run data modify entity @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] Rotation set from entity @p[tag=vexp.attacker,limit=1] Rotation
execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run scoreboard players operation @s vexp.id = #swoosh_owner_id vexp.math
execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run scoreboard players operation @s vexp.id = #swoosh_owner_id vexp.math
scoreboard players set @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] vexp.anim_frame 0
scoreboard players set @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] vexp.anim_delay 0
scoreboard players set @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] vexp.anim_frame 0

tag @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] remove vexp.swoosh.new
tag @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] remove vexp.swoosh_light.new
