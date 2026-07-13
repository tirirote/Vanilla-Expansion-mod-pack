#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"rogue_skeleton",custom_name:"Esqueleto Pícaro", is_hostile:0, can_hunt:0, hunt_targets:"#vexp:targets", scale:1.0f, hp:20, speed:0.5, damage:3, special_damage:0, range:1.5, special_range:6.5, cooldown:0, special_cooldown:32, special_chance:10, can_pickup_item:0, can_eat_item:0, favorite_items:"#custom_item_tag", item_pos_x:0.0f, item_pos_y:0.0f, item_pos_z:0.0f,item_rx:0.0f}}}

# Additional custom data
data modify entity @s equipment merge value {head:{id:"stone",count:1,components:{equippable:{slot:"head",asset_id:"vexp:rogue_skeleton"}}}}
data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:rogue_skeleton"}}}}
data modify entity @s equipment merge value {legs:{id:"stone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:rogue_skeleton"}}}}
data modify entity @s equipment merge value {mainhand:{"id":"minecraft:iron_sword","components":{"minecraft:custom_model_data":{"strings":["vexp:iron_dagger"]}},"count":1}}

data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}
#Setup custom mob data.
function vexp:custom_mobs/setup
