# utils/feedback/swoosh/tick.mcfunction
# @s is item_display with tag vexp.swoosh
# Simplified animation: expose → squash → fade out in 4 frames.

scoreboard players add @s vexp.anim_frame 1

# Frame 1: appear at owner
tag @s add vexp.swoosh.current
execute if score @s vexp.anim_frame matches 1 as @a[tag=vexp.combo_user,distance=..32] if score @s vexp.id = @e[tag=vexp.swoosh.current,limit=1,sort=nearest,distance=..6] vexp.id run data modify entity @e[tag=vexp.swoosh.current,limit=1,sort=nearest,distance=..6] Rotation set from entity @s Rotation
tag @s remove vexp.swoosh.current

#Smart Rotation based on dyaw and dpitch
#function vexp:utils/feedback/swoosh/smart_rotation

# Keyframes
# Frame 2: Stretch
execute if score @s vexp.anim_frame matches 3 run data merge entity @s {start_interpolation:0,interpolation_duration:2,transformation:{scale:[2.5f,1.0f,2.5f]}}

# Frame 4: Fade out (always ease to zero before kill)
execute if score @s vexp.anim_frame matches 5 run data merge entity @s {start_interpolation:0,interpolation_duration:2,transformation:{scale:[0f,0f,0f]}}

kill @s[scores={vexp.anim_frame=8..}]
