# dungeons/combo_system/look/update.mcfunction
# @s is the player

# Track combo users only
execute unless entity @s[tag=vexp.combo_user] run return 0

# Read current camera yaw (x1 precision)
execute store result score @s vexp.look_yaw run data get entity @s Rotation[0] 10
# Read current camera pitch (x1 precision)
execute store result score @s vexp.look_pitch run data get entity @s Rotation[1] 10

# First snapshot for this player
execute unless entity @s[tag=vexp.look_init] run scoreboard players operation @s vexp.look_yaw_prev = @s vexp.look_yaw
execute unless entity @s[tag=vexp.look_init] run scoreboard players operation @s vexp.look_pitch_prev = @s vexp.look_pitch
execute unless entity @s[tag=vexp.look_init] run scoreboard players set @s vexp.look_speed 0
execute unless entity @s[tag=vexp.look_init] run scoreboard players set @s vexp.look_dyaw 0
execute unless entity @s[tag=vexp.look_init] run scoreboard players set @s vexp.look_dpitch 0
execute unless entity @s[tag=vexp.look_init] run tag @s add vexp.look_init

# Raw delta yaw (signed, shortest path with wrap)
scoreboard players operation #look_raw_dyaw vexp.math = @s vexp.look_yaw
scoreboard players operation #look_raw_dyaw vexp.math -= @s vexp.look_yaw_prev
execute if score #look_raw_dyaw vexp.math matches 1801.. run scoreboard players remove #look_raw_dyaw vexp.math 3600
execute if score #look_raw_dyaw vexp.math matches ..-1801 run scoreboard players add #look_raw_dyaw vexp.math 3600

# Raw delta pitch (signed)
scoreboard players operation #look_raw_dpitch vexp.math = @s vexp.look_pitch
scoreboard players operation #look_raw_dpitch vexp.math -= @s vexp.look_pitch_prev

# Attack/release filter:
# - Attack: if raw magnitude >= current magnitude, snap to raw (fast response)
# - Release: otherwise decay smoothly toward 0
scoreboard players operation #look_abs_raw vexp.math = #look_raw_dyaw vexp.math
execute if score #look_abs_raw vexp.math matches ..-1 run scoreboard players operation #look_abs_raw vexp.math *= #neg_one vexp.math

scoreboard players operation #look_abs_filt vexp.math = @s vexp.look_dyaw
execute if score #look_abs_filt vexp.math matches ..-1 run scoreboard players operation #look_abs_filt vexp.math *= #neg_one vexp.math

execute if score #look_abs_raw vexp.math >= #look_abs_filt vexp.math run scoreboard players operation @s vexp.look_dyaw = #look_raw_dyaw vexp.math
execute unless score #look_abs_raw vexp.math >= #look_abs_filt vexp.math run scoreboard players operation @s vexp.look_dyaw *= #smooth_keep vexp.math
execute unless score #look_abs_raw vexp.math >= #look_abs_filt vexp.math run scoreboard players operation @s vexp.look_dyaw /= #smooth_div vexp.math

# Attack/release filter for pitch
scoreboard players operation #look_abs_raw vexp.math = #look_raw_dpitch vexp.math
execute if score #look_abs_raw vexp.math matches ..-1 run scoreboard players operation #look_abs_raw vexp.math *= #neg_one vexp.math

scoreboard players operation #look_abs_filt vexp.math = @s vexp.look_dpitch
execute if score #look_abs_filt vexp.math matches ..-1 run scoreboard players operation #look_abs_filt vexp.math *= #neg_one vexp.math

execute if score #look_abs_raw vexp.math >= #look_abs_filt vexp.math run scoreboard players operation @s vexp.look_dpitch = #look_raw_dpitch vexp.math
execute unless score #look_abs_raw vexp.math >= #look_abs_filt vexp.math run scoreboard players operation @s vexp.look_dpitch *= #smooth_keep vexp.math
execute unless score #look_abs_raw vexp.math >= #look_abs_filt vexp.math run scoreboard players operation @s vexp.look_dpitch /= #smooth_div vexp.math

# Invert pitch response so trail tilt is opposite to camera pitch displacement.
scoreboard players operation @s vexp.look_dpitch *= #neg_one vexp.math

# Absolute values for speed metric
scoreboard players operation #look_dyaw vexp.math = @s vexp.look_dyaw
execute if score #look_dyaw vexp.math matches ..-1 run scoreboard players operation #look_dyaw vexp.math *= #neg_one vexp.math
scoreboard players operation #look_dpitch vexp.math = @s vexp.look_dpitch
execute if score #look_dpitch vexp.math matches ..-1 run scoreboard players operation #look_dpitch vexp.math *= #neg_one vexp.math

# Combined look speed
scoreboard players operation @s vexp.look_speed = #look_dyaw vexp.math
scoreboard players operation @s vexp.look_speed += #look_dpitch vexp.math
execute if score @s vexp.look_speed matches 1201.. run scoreboard players set @s vexp.look_speed 1200

# Save current as previous for next tick
scoreboard players operation @s vexp.look_yaw_prev = @s vexp.look_yaw
scoreboard players operation @s vexp.look_pitch_prev = @s vexp.look_pitch
