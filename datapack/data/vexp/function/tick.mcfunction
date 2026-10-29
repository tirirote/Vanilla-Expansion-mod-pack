# Main tick loop

# Custom Blocks
function vexp:custom_block/tick

# Custom mob HP display
function vexp:mob_health/tick

# Custom Feedback
# Custom Swoosh
execute as @e[type=minecraft:item_display,tag=vexp.swoosh] at @s run function vexp:utils/feedback/swoosh/tick

# Player feedback
function vexp:feedback/player/feedback

# Custom projectile system
execute as @e[type=minecraft:item_display,tag=vexp.projectile] at @s run function vexp:projectile/tick

# Dungeons
function vexp:dungeons/tick

# Custom mobs
function vexp:custom_mobs/tick
