# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"enchanter", custom_name:"Enchanter", is_hostile:0, can_hunt:0, hunt_targets:"#vexp:targets", scale:0.85f, hp:30, speed:0.2, damage:4, special_damage:0, range:4.5, special_range:16, cooldown:36, special_cooldown:256, special_chance:30, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data
data modify entity @s equipment merge value {head:{id:"stone",count:1,components:{"custom_model_data":{strings:["vexp:enchanter_head"]}}}}
data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:enchanter"}}}}
data modify entity @s equipment merge value {legs:{id:"stone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:enchanter"}}}}
data modify entity @s equipment merge value {feet:{id:"stone",count:1,components:{equippable:{slot:"feet",asset_id:"vexp:enchanter"}}}}
data modify entity @s equipment merge value {mainhand:{id:"wooden_spear",count:1,components:{custom_model_data:{strings:["vexp:transparent"]}}}}
data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,feet:0,mainhand:0}
data modify entity @s IsBaby set value false
data modify entity @s Silent set value true
data modify entity @s CanBreakDoors set value false
data modify entity @s DrownedConversionTime set value -1
data modify entity @s DeathLootTable set value "vexp:empty"
effect give @s invisibility infinite 0 true

#Setup custom mob data.
function vexp:custom_mobs/setup

# Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {item:"minecraft:cobblestone", model:"enchanter_book", x:0f, y:-0.35f, z:0.75f, rx:-0.303f, ry:0.0f, rz:0.0f, scale:0.7f, spin_rotation:8}
