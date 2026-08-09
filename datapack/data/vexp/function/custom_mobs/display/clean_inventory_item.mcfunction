# Drop itself when no host
# @s is the item display with tag vexp.custom_mob_inventory

# Drop held item
summon item ~ ~ ~ {Tags:["vexp.temp_mob_drop_item"],Item:{id:"stone",count:1},OnGround:0b,PickupDelay:10}

# Mod item data with held item
data modify entity @e[type=item,sort=nearest,limit=1,distance=..2,tag=vexp.temp_mob_drop_item] Item set from entity @s item
execute as @e[type=item,sort=nearest,limit=1,distance=..2,tag=vexp.temp_mob_drop_item] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}

# Cleanup
tag @e[type=item,sort=nearest,limit=1,distance=..2,tag=vexp.temp_mob_drop_item] remove vexp.temp_mob_drop_item

# Kill orphaned inventory item
kill @s
