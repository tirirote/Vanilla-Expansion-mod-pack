# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"wingler", custom_name:"Grajo", is_hostile:1, scale:1.35f, hp:15, speed:0.3, damage:4, special_damage:6, range:1.5, special_range:6.0, cooldown:32, special_cooldown:96, special_chance:10, can_pickup_item:1, can_eat_item:0, favorite_items:"#vexp:wingler_favorite_items", item_pos_x:0.0f, item_pos_y:-0.45f, item_pos_z:0.65f,item_rx:-0.303f}}}

# Additional custom data
data modify entity @s variant set value "vexp:wingler"
data modify entity @s IsBaby set value false
data modify entity @s Tame set value false
data modify entity @s Anger set value 1
data modify entity @s Silent set value true
data modify entity @s DeathLootTable set value "vexp:empty"
data modify entity @s drop_chances.mainhand set value 1

#Setup custom mob data.
function vexp:custom_mobs/setup

# Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {model:"wingler_overlay", x:0f, y:-0.1f, z:0.1f, rx:-0.303f, ry:0.0f, rz:0.0f, scale:1.4f, spin_rotation:0}
