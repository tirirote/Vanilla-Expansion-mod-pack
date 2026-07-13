# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"wind_burster", custom_name:"Galebreaker", is_hostile:0, can_hunt:0, hunt_targets:"#vexp:targets", scale:1.0f, hp:40, speed:0.6, damage:1, special_damage:6, range:3.5, special_range:3.5, cooldown:8, special_cooldown:96, special_chance:80, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data
data modify entity @s equipment merge value {head:{id:"stone",count:1,components:{"custom_model_data":{strings:["vexp:windburster_head"]}}}}
data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:windburster"}}}}
data modify entity @s equipment merge value {mainhand:{}}
data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}
data modify entity @s IsBaby set value false
data modify entity @s Silent set value true
data modify entity @s CanBreakDoors set value false
data modify entity @s DrownedConversionTime set value -1
data modify entity @s DeathLootTable set value "vexp:empty"
effect give @s invisibility infinite 0 true
effect give @s slow_falling infinite 0 true

#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {item:"minecraft:stone", model:"windburster_overlay", x:0f, y:-0.75f, z:0f, rx:0f, ry:0f, rz:-0.1f, scale:2.1f, spin_rotation:12}
function vexp:custom_mobs/custom_item_display_macro {item:"minecraft:stone", model:"windburster_overlay", x:0f, y:-1.25f, z:0f, rx:0.1f, ry:0.303f, rz:0f, scale:1.7f, spin_rotation:12}
