# Mob drops the item when hurted
# @s is the custom mob

# Drop held item
summon item ~ ~ ~ {Tags:["vexp.temp_mob_drop_item"],Item:{id:"stone",count:1},OnGround:0b,PickupDelay:10}

# Mod item data with held item
data modify entity @e[type=item,sort=nearest,limit=1,distance=..2,tag=vexp.temp_mob_drop_item] Item set from entity @s equipment.mainhand
execute as @e[type=item,sort=nearest,limit=1,distance=..2,tag=vexp.temp_mob_drop_item] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.02}

# Cleanup
tag @e[type=item,sort=nearest,limit=1,distance=..2,tag=vexp.temp_mob_drop_item] remove vexp.temp_mob_drop_item
data remove entity @s equipment.mainhand

# Remove tag
execute if entity @s[tag=vexp.mob_got_item] run tag @s remove vexp.mob_got_item

