# utils/feedback/swoosh/apply_random_position.mcfunction
# @s is the newly spawned item_display swoosh.
# Applies random offset using data.swoosh.random_pos as jitter multiplier.
# Final jitter = base_jitter * scale * random_pos.

scoreboard players set #swoosh_randpos100 vexp.math 0
execute store result score #swoosh_randpos100 vexp.math run data get entity @s data.swoosh.random_pos 100
execute unless score #swoosh_randpos100 vexp.math matches 1.. run return 0

scoreboard players set #swoosh_scale100 vexp.math 100
execute store result score #swoosh_scale100 vexp.math run data get entity @s data.swoosh.scale 100

# Base jitter (in hundredths): X/Z +/-0.50, Y +/-0.20
execute store result score #swoosh_rx vexp.math run random value -50..50
execute store result score #swoosh_ry vexp.math run random value -20..20
execute store result score #swoosh_rz vexp.math run random value -50..50

# Multiply jitter by scale multiplier
scoreboard players operation #swoosh_rx vexp.math *= #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_rx vexp.math /= #force_scale vexp.math
scoreboard players operation #swoosh_ry vexp.math *= #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_ry vexp.math /= #force_scale vexp.math
scoreboard players operation #swoosh_rz vexp.math *= #swoosh_scale100 vexp.math
scoreboard players operation #swoosh_rz vexp.math /= #force_scale vexp.math

# Multiply jitter by random_pos multiplier
scoreboard players operation #swoosh_rx vexp.math *= #swoosh_randpos100 vexp.math
scoreboard players operation #swoosh_rx vexp.math /= #force_scale vexp.math
scoreboard players operation #swoosh_ry vexp.math *= #swoosh_randpos100 vexp.math
scoreboard players operation #swoosh_ry vexp.math /= #force_scale vexp.math
scoreboard players operation #swoosh_rz vexp.math *= #swoosh_randpos100 vexp.math
scoreboard players operation #swoosh_rz vexp.math /= #force_scale vexp.math

# Store for macro teleport
execute store result storage vexp:temp swoosh.offset.dx float 0.01 run scoreboard players get #swoosh_rx vexp.math
execute store result storage vexp:temp swoosh.offset.dy float 0.01 run scoreboard players get #swoosh_ry vexp.math
execute store result storage vexp:temp swoosh.offset.dz float 0.01 run scoreboard players get #swoosh_rz vexp.math

# Move visual and light together using the same offset
function vexp:utils/feedback/swoosh/apply_random_position_macro with storage vexp:temp swoosh.offset
execute as @e[type=armor_stand,tag=vexp.swoosh_light.new,sort=nearest,limit=1,distance=..1] run function vexp:utils/feedback/swoosh/apply_random_position_macro with storage vexp:temp swoosh.offset
