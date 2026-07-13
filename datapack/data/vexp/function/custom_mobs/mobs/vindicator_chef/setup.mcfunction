# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"vindicator_chef", custom_name:"Vindicador Chef", is_hostile:0, can_hunt:0, hunt_targets:"#vexp:targets", scale:1.0f, hp:30, speed:0.4, damage:2, special_damage:0, range:0.0, special_range:0.0, cooldown:0, special_cooldown:0, special_chance:0, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data
data modify entity @s equipment merge value {head:{id:"cobblestone",count:1,components:{custom_model_data:{strings:["vexp:vindicator_chef_hat"]}}}}

data modify entity @s equipment merge value {mainhand:{id:"wooden_axe",count:1,components:{custom_model_data:{strings:["vexp:vindicator_chef_spoon"]}}}}
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,feet:0,mainhand:0}
data modify entity @s DeathLootTable set value "vexp:empty"
#Setup custom mob data.
function vexp:custom_mobs/setup

# Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {item:"minecraft:cobblestone", model:"vindicator_chef_apron", x:0f, y:-1.135f, z:0.0f, rx:0.0f, ry:0.0f, rz:0.0f, scale:1.2f, spin_rotation:0}
