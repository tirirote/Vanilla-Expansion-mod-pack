# Main tick loop
function vexp:custom_block/tick

#Dungeons
function vexp:dungeons/tick

#Custom mobs
function vexp:custom_mobs/tick

# Custom projectile system
execute as @e[type=minecraft:item_display,tag=vexp.projectile] at @s run function vexp:projectile/tick

#Pirotecnics
function vexp:tnt_stick/tick

# Extra Feedback
function vexp:feedback/tick

# Utils
function vexp:utils/feedback/tick

#Custom mob HP display
function vexp:mob_health/tick

# TAG CLEANUP (End of tick)
tag @e[tag=vexp.hit_candidate] remove vexp.hit_candidate
tag @a[tag=vexp.attacker] remove vexp.attacker
tag @e[tag=vexp.hitted] remove vexp.hitted
tag @e[tag=vexp.parried] remove vexp.parried
data remove storage vexp:dungeons.weapon combo_params
