# utils/feedback/swoosh/tick.mcfunction
# @s is item_display with tag vexp.swoosh
# Simplified animation: expose → squash → fade out in 4 frames.

# Tag current swoosh
tag @s add vexp.swoosh.current

# Timing from payload lifetime
scoreboard players set #swoosh_life vexp.math 8
execute store result score #swoosh_life vexp.math run data get entity @s data.swoosh.lifetime 1
execute if score #swoosh_life vexp.math matches ..0 run scoreboard players set #swoosh_life vexp.math 8

# Swoosh follows owner
execute if data entity @s data.swoosh{follow_owner:1} run function vexp:utils/feedback/swoosh/follow_owner_tp with entity @s data.swoosh.follow_offset

# Remove tag
tag @s remove vexp.swoosh.current

# Lifetime management for swooshes
scoreboard players add @s vexp.anim_frame 1
execute if score @s vexp.anim_frame >= #swoosh_life vexp.math run kill @s
