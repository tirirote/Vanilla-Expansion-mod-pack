# Summon custom mini muummy
summon husk ~ ~ ~ {IsBaby:true,Tags:["vexp.mummy_minion_new","vexp.custom_mob"]}

# Setup
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run data modify entity @s equipment merge value {head:{id:"cobblestone",count:1,components:{equippable:{slot:"head",asset_id:"vexp:mummy_zombie"}}}}
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run data modify entity @s equipment merge value {chest:{id:"cobblestone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:mummy_zombie"}}}}
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run data modify entity @s equipment merge value {legs:{id:"cobblestone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:mummy_zombie"}}}}
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run data modify entity @s equipment merge value {mainhand:{}}
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run data modify entity @s ItemDropChance set value 0
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}

execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] run function vexp:custom_mobs/setup_attributes {hp:8,damage:2,speed:0.15,scale:1.0,custom_name:"Momificado"}

# Feedback
execute as @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] at @s run particle block{block_state:"sand"} ~ ~0.25 ~ 1 0 1 0.35 25

tag @e[type=husk,tag=vexp.mummy_minion_new,limit=1,distance=..6] remove vexp.mummy_minion_new
