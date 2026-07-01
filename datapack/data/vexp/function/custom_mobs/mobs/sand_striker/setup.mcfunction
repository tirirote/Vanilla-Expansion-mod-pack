# Setup custom mob data
# @s is the custom mob

# Main custom data (type -> folder name)
data modify entity @s data set value {vexp:{mob:{type:"sand_striker",custom_name:"Arenoso", is_hostile:0, scale:1.0f, hp:8, speed:0.2, damage:2, special_damage:1, range:1.25, special_range:2.5, cooldown:8, special_cooldown:32, special_chance:10, can_pickup_item:1, can_eat_item:1, favorite_items:"#vexp:sandstriker_favorite_items", item_pos_x:0.0f, item_pos_y:-0.6f, item_pos_z:0.6f, item_rx:1f}}}
# Additional custom data
data modify entity @s variant set value "vexp:sand_striker"
data remove entity @s equipment
data modify entity @s drop_chances set value {body:0}
data modify entity @s IsBaby set value false
data modify entity @s Tame set value false
data modify entity @s Silent set value true
data modify entity @s DeathLootTable set value "vexp:empty"

#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
#function vexp:custom_mobs/custom_item_display_macro {model:"vexp:webbing_spider_overlay", x:0f, y:0.95f, z:-0.95f}
