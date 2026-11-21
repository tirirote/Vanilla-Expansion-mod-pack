# Main tick loop

# Assign Id on first tick
execute as @a unless score @s vexp.id matches 1.. run function vexp:utils/assign_id

# Custom Blocks
function vexp:custom_block/tick

# Dungeons
function vexp:dungeons/tick

# Custom mobs
function vexp:custom_mobs/tick

# Custom Feedback
# Custom Swoosh
execute as @e[type=minecraft:item_display,tag=vexp.swoosh] at @s run function vexp:utils/feedback/swoosh/tick

# Player feedback
function vexp:feedback/player/feedback

# Custom projectile system
execute as @e[type=minecraft:item_display,tag=vexp.projectile] at @s run function vexp:projectile/tick

# Other
# Custom mob HP display
function vexp:mob_health/tick
