#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"hollow",custom_name:"Hueco", hp:40, speed:0.4, damage:1, special_damage:4, range:1, special_range:5.5, cooldown:0, special_cooldown:36, special_chance:50}}}

#Custom armor
data modify entity @s equipment merge value {head:{id:"iron_helmet",count:1,components:{equippable:{slot:"head",asset_id:"vexp:hollow"}}}}

data modify entity @s equipment merge value {chest:{id:"iron_chestplate",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:hollow"}}}}

data modify entity @s equipment merge value {legs:{}}

data modify entity @s equipment merge value {mainhand:{}}

data modify entity @s Silent set value 1b
data modify entity @s ItemDropChance set value 0b
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}

effect give @s invisibility infinite 0 true
effect give @s slow_falling infinite 1 true

#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
function vexp:custom_mobs/custom_item_display_macro {model:"hollow_overlay", x:0f, y:-0.5f, z:-0.05f, height:1, spin_rotation:0}
