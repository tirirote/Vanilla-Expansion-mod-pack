# dungeons/bow/arrows/custom_motion.mcfunction
# @s is a custom bow arrow with normalized motion vector.
# Reapply base motion each tick and apply configurable gravity reduction.

# Save current vertical speed after physics step.
data modify storage vexp:temp arrow_motion_y set from entity @s Motion[1]

# Reapply stored base motion (keeps horizontal speed stable).
data modify entity @s Motion set from entity @s data.vexp.motion_normalized

# Convert Y speed to scoreboard (scale 1000), then compensate part of vanilla gravity.
execute store result score #bow_y vexp.math run data get storage vexp:temp arrow_motion_y 1000
scoreboard players operation #bow_grav_comp vexp.math = #scale1000 vexp.math
scoreboard players operation #bow_grav_comp vexp.math -= #bow_gravity_mult vexp.math
scoreboard players operation #bow_grav_comp vexp.math *= #bow_gravity_unit vexp.math
scoreboard players operation #bow_grav_comp vexp.math /= #scale1000 vexp.math
scoreboard players operation #bow_y vexp.math += #bow_grav_comp vexp.math

# Restore adjusted vertical speed.
execute store result storage vexp:temp arrow_motion_y double 0.001 run scoreboard players get #bow_y vexp.math
data modify entity @s Motion[1] set from storage vexp:temp arrow_motion_y
