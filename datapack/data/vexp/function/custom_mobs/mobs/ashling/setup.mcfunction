# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"ashling",custom_name:"Ashling", is_hostile:1, can_hunt:1, hunt_targets:"#vexp:ashling_favorite_mobs", scale:1.125f, hp:20, speed:0.3, damage:6, special_damage:4, range:2.0, special_range:2.5, cooldown:16, special_cooldown:96, special_chance:30, can_pickup_item:1, can_eat_item:1, favorite_items:"#vexp:ashling_favorite_items", item_pos_x:0.0f, item_pos_y:-0.35f, item_pos_z:0.85f,item_rx:-0.707f}}}

# Additional custom data
data modify entity @s variant set value "vexp:ashling"
data modify entity @s IsBaby set value false
data modify entity @s Tame set value false
data modify entity @s Silent set value true
data modify entity @s DeathLootTable set value "vexp:empty"
effect give @s fire_resistance infinite 1 true
data modify entity @s drop_chances.mainhand set value 1

#Setup custom mob data.
function vexp:custom_mobs/setup

# Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {model:"ashling_overlay", x:0f, y:-0.05f, z:0.15f, rx:-0.101f, ry:0.0f, rz:0.0f, scale:1.5f, spin_rotation:0}
