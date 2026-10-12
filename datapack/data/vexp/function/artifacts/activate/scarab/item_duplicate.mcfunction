# Scarab fortune duplication
# @s is the item to duplicate

# Summon duplicate
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}
$summon item ~ ~ ~ {Item:$(Item),Tags:["vexp.scarab_duplicate_loot"]}

# Feedback
data modify entity @s Glowing set value true
team join vexp.yellow

execute as @e[type=item,tag=vexp.scarab_duplicate_loot,distance=..2,sort=nearest] run data modify entity @s Glowing set value true
execute as @e[type=item,tag=vexp.scarab_duplicate_loot,distance=..2,sort=nearest] run team join vexp.yellow
execute as @e[type=item,tag=vexp.scarab_duplicate_loot,distance=..2,sort=nearest] run particle instant_effect{color:11140976,power:2} ~ ~ ~ 0 0 0 1 1
execute as @e[type=item,tag=vexp.scarab_duplicate_loot,distance=..2,sort=nearest] run particle instant_effect{color:16772690,power:2} ~ ~ ~ 0 0 0 1 2
execute as @e[type=item,tag=vexp.scarab_duplicate_loot,distance=..2,sort=nearest] run function vexp:utils/motion/apply_random_motion {"range":10,"scale":0.01}

tag @s add vexp.scarab_duplicate
