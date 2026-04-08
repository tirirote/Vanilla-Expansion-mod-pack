# utils/feedback/swoosh/spawn.mcfunction
# @s is the player
# Params: $(model)
# Each trail spawned at age 0 for maximum temporal resolution.

$execute anchored eyes positioned ^ ^ ^ run summon item_display ~ ~ ~ {Tags:["vexp.swoosh","vexp.swoosh.new"],item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_model_data":{strings:["$(model)"]}}},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:2,view_range:1.0f}

# Brief dynamic light helper (small+marker armor stand in flames).
execute anchored eyes positioned ^ ^ ^ run summon minecraft:armor_stand ~ ~ ~ {Tags:["vexp.swoosh_light","vexp.swoosh_light.new"],Marker:1b,Small:1b,Invisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Fire:32767s,HasVisualFire:1b}

# Randomize initial swoosh size for visual variety.
execute store result score #swoosh_scale_rand vexp.math run random value 0..4
execute if score #swoosh_scale_rand vexp.math matches 0 run data merge entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] {transformation:{scale:[0.5f,0.5f,0.5f]}}
execute if score #swoosh_scale_rand vexp.math matches 1 run data merge entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] {transformation:{scale:[1.5f,1f,0.5f]}}
execute if score #swoosh_scale_rand vexp.math matches 2 run data merge entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] {transformation:{scale:[0.5f,1f,1.5f]}}
execute if score #swoosh_scale_rand vexp.math matches 3 run data merge entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] {transformation:{scale:[2.5f,1f,0.25f]}}
execute if score #swoosh_scale_rand vexp.math matches 4 run data merge entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] {transformation:{scale:[0.25f,1f,2.5f]}}

tag @s add vexp.swoosh_owner
data modify entity @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] Rotation set from entity @s Rotation
execute as @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] run scoreboard players operation @s vexp.id = @a[tag=vexp.swoosh_owner,limit=1,sort=nearest] vexp.id
execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,limit=1,sort=nearest,distance=..3] run scoreboard players operation @s vexp.id = @a[tag=vexp.swoosh_owner,limit=1,sort=nearest] vexp.id
scoreboard players set @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] vexp.anim_frame 0
scoreboard players set @e[type=armor_stand,tag=vexp.swoosh_light.new,limit=1,sort=nearest,distance=..3] vexp.anim_frame 0
scoreboard players operation @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] vexp.anim_delay = #swoosh_scale_rand vexp.math
tag @e[type=item_display,tag=vexp.swoosh.new,limit=1,sort=nearest,distance=..3] remove vexp.swoosh.new
tag @e[type=armor_stand,tag=vexp.swoosh_light.new,limit=1,sort=nearest,distance=..3] remove vexp.swoosh_light.new
tag @s remove vexp.swoosh_owner
