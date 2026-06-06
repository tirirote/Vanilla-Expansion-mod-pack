# utils/feedback/swoosh/tick.mcfunction
# @s is item_display with tag vexp.swoosh
# Simplified animation: expose → squash → fade out in 4 frames.

scoreboard players add @s vexp.anim_frame 1

# Timing from payload lifetime
scoreboard players set #const_4 vexp.math 4
scoreboard players set #swoosh_life vexp.math 8
execute store result score #swoosh_life vexp.math run data get entity @s data.swoosh.lifetime 1
execute if score #swoosh_life vexp.math matches ..0 run scoreboard players set #swoosh_life vexp.math 8

scoreboard players operation #swoosh_interp vexp.math = #swoosh_life vexp.math
scoreboard players operation #swoosh_interp vexp.math /= #const_4 vexp.math
execute if score #swoosh_interp vexp.math matches ..0 run scoreboard players set #swoosh_interp vexp.math 1

scoreboard players operation #swoosh_stretch vexp.math = #swoosh_interp vexp.math
scoreboard players operation #swoosh_fade vexp.math = #swoosh_life vexp.math
scoreboard players operation #swoosh_fade vexp.math -= #swoosh_interp vexp.math
execute if score #swoosh_fade vexp.math <= #swoosh_stretch vexp.math run scoreboard players operation #swoosh_fade vexp.math = #swoosh_stretch vexp.math
execute if score #swoosh_fade vexp.math <= #swoosh_stretch vexp.math run scoreboard players add #swoosh_fade vexp.math 1

# Frame 1: appear at owner
tag @s add vexp.swoosh.current

execute if score @s vexp.anim_frame matches 1 as @a[tag=vexp.combo_user,distance=..32] if score @s vexp.id = @e[tag=vexp.swoosh.current,nbt={data:{swoosh:{face_player:1}}},limit=1,sort=nearest,distance=..16] vexp.id run data modify entity @e[tag=vexp.swoosh.current,nbt={data:{swoosh:{face_player:1}}},limit=1,sort=nearest,distance=..16] Rotation set from entity @s Rotation

execute if data entity @s data.swoosh{follow_owner:1} run function vexp:utils/feedback/swoosh/follow_owner_tp with entity @s data.swoosh.follow_offset

tag @s remove vexp.swoosh.current

#Smart Rotation based on dyaw and dpitch
#function vexp:utils/feedback/swoosh/smart_rotation

# Keyframes
# Frame 2: Stretch
execute if score @s vexp.anim_frame = #swoosh_stretch vexp.math run data merge entity @s {start_interpolation:0}
execute if score @s vexp.anim_frame = #swoosh_stretch vexp.math store result entity @s interpolation_duration int 1 run scoreboard players get #swoosh_interp vexp.math
execute if score @s vexp.anim_frame = #swoosh_stretch vexp.math run function vexp:utils/feedback/swoosh/apply_scaled_stretch

# Frame 4: Fade out (always ease to zero before kill)
execute if score @s vexp.anim_frame = #swoosh_fade vexp.math run data merge entity @s {start_interpolation:0,transformation:{scale:[0f,0f,0f]}}
execute if score @s vexp.anim_frame = #swoosh_fade vexp.math store result entity @s interpolation_duration int 1 run scoreboard players get #swoosh_interp vexp.math

execute if score @s vexp.anim_frame >= #swoosh_life vexp.math run kill @s
