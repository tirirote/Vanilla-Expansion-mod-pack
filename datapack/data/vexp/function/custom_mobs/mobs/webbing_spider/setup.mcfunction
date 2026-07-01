# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"webbing_spider",custom_name:"Araña Tejedora", is_hostile:0, scale:1.0f, hp:24, speed:0.5, damage:2, special_damage:1, range:1.25, special_range:4.5, cooldown:8, special_cooldown:64, special_chance:20, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data

#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
#function vexp:custom_mobs/custom_item_display_macro {model:"vexp:webbing_spider_overlay", x:0f, y:0.95f, z:-0.95f}
