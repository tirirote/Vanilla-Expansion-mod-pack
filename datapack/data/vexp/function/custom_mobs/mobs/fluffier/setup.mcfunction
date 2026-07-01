# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"fluffier", custom_name:"Fluffier", is_hostile:0, scale:1.0f, hp:10, speed:0.0, damage:0, special_damage:0, range:0.0, special_range:16.5, cooldown:0, special_cooldown:48, special_chance:50, can_pickup_item:1, can_eat_item:1, favorite_items:"#vexp:fluffier_favorite_items", item_pos_x:0.0f, item_pos_y:-0.6f, item_pos_z:0.45f,item_rx:0.303f}}}

# Additional custom data
data modify entity @s variant set value "vexp:fluffier"
data modify entity @s IsBaby set value false
data modify entity @s Tame set value false
data modify entity @s Silent set value true
data modify entity @s DeathLootTable set value "vexp:empty"

#Setup custom mob data.
function vexp:custom_mobs/setup
