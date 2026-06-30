#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"lapis_zombie",custom_name:"Zombie Lapislázuli", scale:1.0f, hp:30, speed:0.3, damage:4, special_damage:6, range:1, special_range:3.5, cooldown:0, special_cooldown:36, special_chance:30}}}

#Custom armor
data modify entity @s equipment merge value {head:{id:"stone",count:1,components:{equippable:{slot:"head",asset_id:"vexp:lapis_zombie"}}}}
data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:lapis_zombie"}}}}
data modify entity @s equipment merge value {legs:{id:"stone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:lapis_zombie"}}}}
data modify entity @s equipment merge value {mainhand:{}}
data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}

#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
#function vexp:custom_mobs/custom_item_display_macro {model:"vexp:webbing_spider_overlay", x:0f, y:0.95f, z:-0.95f}
