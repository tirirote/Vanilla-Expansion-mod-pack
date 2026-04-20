# utils/feedback/swoosh/spawn.mcfunction
# @s is the hit mob (vexp.hitted), at @s = mob's position.
# Params: $(model)

# Capture attacker ID once via score — avoids a temp player tag (and the stale-tag bug
# that would occur if tag @s remove ran on the mob instead of the player).
scoreboard players operation #swoosh_owner_id vexp.math = @p[tag=vexp.attacker,limit=1] vexp.id

# Spawn item_display (visual) and armor_stand (dynamic light) at mob position, facing attacker.
$execute facing entity @p[tag=vexp.attacker,limit=1] eyes run summon item_display ~ ~ ~ {Tags:["vexp.swoosh","vexp.swoosh.new"],item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_model_data":{strings:["$(model)"]}}},transformation:{left_rotation:[0.7071f,0f,0f,0.7071f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},brightness:{block:15,sky:15},teleport_duration:1,interpolation_duration:3,view_range:1.0f}
execute facing entity @p[tag=vexp.attacker,limit=1] eyes run summon minecraft:armor_stand ~ ~ ~ {Tags:["vexp.swoosh_light","vexp.swoosh_light.new"],Marker:1b,Small:1b,Invisible:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,Fire:32767s,HasVisualFire:1b}

# Randomize initial scale for visual variety.
# distance=..1: both entities were just summoned at ~ ~ ~ (mob's exact position).
execute store result score #swoosh_scale_rand vexp.math run random value 0..4
execute if score #swoosh_scale_rand vexp.math matches 0 as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data merge entity @s {transformation:{scale:[0.5f,0.5f,0.5f]}}
execute if score #swoosh_scale_rand vexp.math matches 1 as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data merge entity @s {transformation:{scale:[2f,1f,0.25f]}}
execute if score #swoosh_scale_rand vexp.math matches 2 as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data merge entity @s {transformation:{scale:[0.25f,1f,2f]}}
execute if score #swoosh_scale_rand vexp.math matches 3 as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data merge entity @s {transformation:{scale:[1.5f,1f,0.125f]}}
execute if score #swoosh_scale_rand vexp.math matches 4 as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run data merge entity @s {transformation:{scale:[0.125f,1f,1.5f]}}

# Link both entities to the attacker and initialise animation state.
data modify entity @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] Rotation set from entity @p[tag=vexp.attacker,limit=1] Rotation
execute as @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] run scoreboard players operation @s vexp.id = #swoosh_owner_id vexp.math
execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run scoreboard players operation @s vexp.id = #swoosh_owner_id vexp.math
scoreboard players set @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] vexp.anim_frame 0
scoreboard players operation @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] vexp.anim_delay = #swoosh_scale_rand vexp.math
scoreboard players set @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] vexp.anim_frame 0

tag @e[type=item_display,tag=vexp.swoosh.new,sort=nearest,limit=1,distance=..1] remove vexp.swoosh.new
tag @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] remove vexp.swoosh_light.new
