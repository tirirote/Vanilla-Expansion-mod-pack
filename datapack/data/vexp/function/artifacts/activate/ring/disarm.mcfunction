# Disarm target
summon item ~ ~ ~ {Tags:["vexp.ring_disarm_loot","vexp.ring_disarm_loot_new"],Item:{id:"stone",count:1b}}

data modify entity @e[type=item,tag=vexp.ring_disarm_loot_new,distance=..3,limit=1] Item set from entity @s equipment.mainhand
execute as @e[type=item,tag=vexp.ring_disarm_loot_new,distance=..3,sort=nearest] run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}

# Data removal
data remove entity @s equipment.mainhand
data remove entity @s CanPickUpLoot

# Feedback
execute as @e[type=item,tag=vexp.ring_disarm_loot_new,distance=..3,limit=1] run data modify entity @s Glowing set value true
execute as @e[type=item,tag=vexp.ring_disarm_loot_new,distance=..3,limit=1] run team join vexp.yellow
tag @e[type=item,tag=vexp.ring_disarm_loot_new,distance=..3,limit=1] remove vexp.ring_disarm_loot_new

# Allow this mob to be targeted again if it re-arms later
tag @s remove vexp.ring_target
