# utils/feedback/swoosh/tick.mcfunction
# @s is item_display with tag vexp.swoosh
# Simplified animation: expose → squash → fade out in 4 frames.

scoreboard players add @s vexp.anim_frame 1

# Frame 1: appear at owner
tag @s add vexp.swoosh.current
#execute if score @s vexp.anim_frame matches 1 as @a[tag=vexp.combo_user,distance=..32] if score @s vexp.id = @e[tag=vexp.swoosh.current,limit=1] vexp.id at @s anchored eyes run tp @e[tag=vexp.swoosh.current,limit=1] ^ ^ ^3.5 ~ ~
execute if score @s vexp.anim_frame matches 1 as @a[tag=vexp.combo_user,distance=..32] if score @s vexp.id = @e[tag=vexp.swoosh.current,limit=1] vexp.id run data modify entity @e[tag=vexp.swoosh.current,limit=1] Rotation set from entity @s Rotation

#Smart Rotation based on dyaw and dpitch
function vexp:utils/feedback/swoosh/smart_rotation

#Particles
# Keyframes
# Frame 2: Stretch
execute if score @s vexp.anim_frame matches 3 run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{scale:[2.0f,1.0f,0.5f]}}

# Frame 4: Fade out
execute if score @s vexp.anim_frame matches 6 run data merge entity @s {start_interpolation:0,interpolation_duration:3,transformation:{scale:[4.0f,1.0f,0.0f]}}

kill @s[scores={vexp.anim_frame=9..}]
