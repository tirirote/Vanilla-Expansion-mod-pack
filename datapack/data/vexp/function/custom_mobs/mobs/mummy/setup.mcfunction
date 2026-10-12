# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"mummy", custom_name:"Momificado", is_hostile:0, can_hunt:0, hunt_targets:"#vexp:targets", scale:1.0f, hp:30, speed:0.2, damage:4, special_damage:0, range:0.0, special_range:8.5, cooldown:0, special_cooldown:92, special_chance:60, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data
data modify entity @s equipment merge value {head:{id:"cobblestone",count:1,components:{equippable:{slot:"head",asset_id:"vexp:mummy_zombie"}}}}
data modify entity @s equipment merge value {chest:{id:"cobblestone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:mummy_zombie"}}}}
data modify entity @s equipment merge value {legs:{id:"cobblestone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:mummy_zombie"}}}}
data modify entity @s equipment merge value {mainhand:{}}
data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}

#Setup custom mob data.
function vexp:custom_mobs/setup
