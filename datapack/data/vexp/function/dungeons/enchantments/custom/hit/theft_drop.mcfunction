# @s is the player, positioned at a theft_target.
# Running as the player makes them the killer in the loot context.
loot spawn ~ ~ ~ kill @e[tag=vexp.theft_target,distance=..0.1,sort=nearest,limit=1]

# Summon xp
execute store result score #theft_xp_roll vexp.math run random value 0..4
execute if score #theft_xp_roll vexp.math matches 1 run summon experience_orb ~ ~ ~ {Value:1,Tags:["vexp.summoned_xp"]}
execute if score #theft_xp_roll vexp.math matches 2 run summon experience_orb ~ ~ ~ {Value:2,Tags:["vexp.summoned_xp"]}
execute if score #theft_xp_roll vexp.math matches 3 run summon experience_orb ~ ~ ~ {Value:3,Tags:["vexp.summoned_xp"]}
execute if score #theft_xp_roll vexp.math matches 4 run summon experience_orb ~ ~ ~ {Value:5,Tags:["vexp.summoned_xp"]}

execute as @e[type=experience_orb,tag=vexp.summoned_xp,distance=..1,sort=nearest,limit=1] run function vexp:utils/motion/apply_random_motion {range:10, scale:0.01}

# Keep exactly one random stack, reduced to a single item.
tag @e[type=item,tag=!vexp.theft_loot,distance=..1.5,nbt={Age:0s}] add vexp.theft_new
execute unless entity @e[tag=vexp.theft_new,distance=..1.5,limit=1] run return 0

tag @e[tag=vexp.theft_new,distance=..1.5,sort=random,limit=1] add vexp.theft_keep
kill @e[tag=vexp.theft_new,tag=!vexp.theft_keep,distance=..1.5]
data modify entity @e[tag=vexp.theft_keep,distance=..1.5,limit=1] Item.count set value 1

# theft_loot keeps this item out of the next target's selection in the same tick.
tag @e[tag=vexp.theft_keep,distance=..1.5] add vexp.theft_loot
tag @e[tag=vexp.theft_keep,distance=..1.5] remove vexp.theft_keep
tag @e[tag=vexp.theft_new,distance=..1.5] remove vexp.theft_new
