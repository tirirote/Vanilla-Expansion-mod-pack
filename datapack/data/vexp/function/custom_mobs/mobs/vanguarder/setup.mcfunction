#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"vanguarder",custom_name:"Glifo", hp:30, speed:0.3, damage:1, special_damage:4, range:0.5, special_range:0.5, cooldown:32, special_cooldown:96, special_chance:5}}}

#Custom armor
data modify entity @s equipment merge value {head:{id:"stone",count:1,components:{equippable:{slot:"head",asset_id:"vexp:vanguarder"}}}}
data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:vanguarder"}}}}
data modify entity @s equipment merge value {legs:{id:"stone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:vanguarder"}}}}
data modify entity @s equipment merge value {feet:{id:"stone",count:1,components:{equippable:{slot:"feet",asset_id:"vexp:vanguarder"}}}}
data modify entity @s equipment merge value {mainhand:{}}
data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}
data modify entity @s IsBaby set value false
data modify entity @s Silent set value true
data modify entity @s CanBreakDoors set value false
data modify entity @s DrownedConversionTime set value -1
effect give @s invisibility infinite 0 true
#Setup custom mob data.
function vexp:custom_mobs/setup

# the vanguarder is summoned via a custom block statue
