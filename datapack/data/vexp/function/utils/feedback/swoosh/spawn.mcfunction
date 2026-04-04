# utils/feedback/swoosh/spawn.mcfunction
# @s is the player
# Params: $(item_id), $(model), $(sx), $(sy), $(sz), $(dist)
# Each trail spawned at age 0 for maximum temporal resolution.

$execute anchored eyes positioned ^ ^ ^$(dist) run summon item_display ~ ~ ~ {Tags:["vexp.swoosh","vexp.swoosh.new"],item:{id:"$(item_id)",count:1,components:{"minecraft:custom_model_data":{strings:["$(model)"]}}},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[$(sx),$(sy),$(sz)]},teleport_duration:1,interpolation_duration:3,view_range:1.0f}

tag @s add vexp.swoosh_owner
data modify entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] Rotation set from entity @s Rotation
execute as @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] run scoreboard players operation @s vexp.id = @a[tag=vexp.swoosh_owner,limit=1,sort=nearest] vexp.id
scoreboard players set @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] vexp.anim_frame 0
scoreboard players set @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] vexp.anim_delay 0
tag @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] remove vexp.swoosh.new
tag @s remove vexp.swoosh_owner
