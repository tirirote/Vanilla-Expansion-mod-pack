# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"vanguarder",custom_name:"Glifo", is_hostile:0, scale:1.0f, hp:30, speed:0.3, damage:4, special_damage:8, range:1.0, special_range:3.5, cooldown:16, special_cooldown:64, special_chance:50, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data
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
data modify entity @s DeathLootTable set value "vexp:empty"
effect give @s invisibility infinite 0 true

#Setup custom mob data.
function vexp:custom_mobs/setup

# the vanguarder is summoned via a custom block statue
