# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"template", custom_name:"Template", is_hostile:0, can_hunt:0, hunt_targets:"#vexp:targets", scale:1.0f, hp:10, speed:0.0, damage:0, special_damage:0, range:0.0, special_range:0.0, cooldown:0, special_cooldown:0, special_chance:0, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data

#Setup custom mob data.
function vexp:custom_mobs/setup

# Summon custom Model
#function vexp:custom_mobs/custom_item_display_macro {model:"custom_overlay", x:0f, y:0.0f, z:0.0f, rx:0.0f, ry:0.0f, rz:0.0f, scale:1.0f, spin_rotation:0}
