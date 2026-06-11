#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"wind_burster",custom_name:"Galebreaker", hp:40, speed:0.6, damage:1, special_damage:6, range:3.5, special_range:6, cooldown:8, special_cooldown:96, special_chance:80}}}

#Custom armor
data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:windburster"}}}}
data modify entity @s equipment merge value {mainhand:{}}
data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}
data modify entity @s IsBaby set value false
data modify entity @s Silent set value true
data modify entity @s CanBreakDoors set value false
data modify entity @s DrownedConversionTime set value -1
effect give @s invisibility infinite 0 true
effect give @s slow_falling infinite 0 true
#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {model:"windburster_overlay", x:0f, y:-1.25f, z:0f, scale:2f, spin_rotation:24}
