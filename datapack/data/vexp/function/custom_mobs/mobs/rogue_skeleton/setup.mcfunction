#Custom mob data
data modify entity @s data set value {vexp:{mob:{type:"rogue_skeleton",custom_name:"Esqueleto Pícaro", hp:20, speed:0.5, damage:3, special_damage:0, range:1.5, special_range:6.5, cooldown:0, special_cooldown:32, special_chance:10}}}

#Custom armor
data modify entity @s equipment merge value {head:{id:"stone",count:1,components:{equippable:{slot:"head",asset_id:"vexp:rogue_skeleton"}}}}

data modify entity @s equipment merge value {chest:{id:"stone",count:1,components:{equippable:{slot:"chest",asset_id:"vexp:rogue_skeleton"}}}}

data modify entity @s equipment merge value {legs:{id:"stone",count:1,components:{equippable:{slot:"legs",asset_id:"vexp:rogue_skeleton"}}}}

data modify entity @s equipment merge value {mainhand:{"id":"minecraft:iron_sword","components":{"minecraft:item_name":"Daga de Hierro","minecraft:custom_data":{"vexp":{"type":"mid_combo","item":"dagger","material":"iron","combo":{"desc":"Rápida y resistente.","rc_desc":"Arrojadiza.","damage":4,"cooldown":4,"right_click_cooldown":12,"range":1.5,"reach":1.25,"quality":"normal"}}},"tooltip_display":{"hidden_components":["minecraft:attribute_modifiers"]},"minecraft:custom_model_data":{"strings":["vexp:iron_dagger"]},"minecraft:attribute_modifiers":[{"type":"minecraft:attack_damage","amount":-1,"operation":"add_value","id":"vexp:dagger_damage","slot":"mainhand"},{"type":"minecraft:attack_speed","amount":1,"operation":"add_value","id":"vexp:dagger_speed","slot":"mainhand"},{"type":"minecraft:entity_interaction_range","amount":-1,"operation":"add_value","id":"vexp:dagger_reach","slot":"mainhand"},{"type":"minecraft:block_interaction_range","amount":-1,"operation":"add_value","id":"vexp:dagger_block_reach","slot":"mainhand"}],"minecraft:repairable":{"items":["minecraft:iron_ingot"]},"repair_cost":1,"food":{"nutrition":0,"saturation":0,"can_always_eat":true},"consumable":{"animation":"bow","consume_seconds":999999,"has_consume_particles":false}},"count":1}}

data modify entity @s ItemDropChance set value 0
data modify entity @s drop_chances set value {head:0,chest:0,legs:0,mainhand:0}
#Setup custom mob data.
function vexp:custom_mobs/setup

#Summon custom Model
#function vexp:custom_mobs/custom_item_display_macro {model:"vexp:webbing_spider_overlay", x:0f, y:0.95f, z:-0.95f}
