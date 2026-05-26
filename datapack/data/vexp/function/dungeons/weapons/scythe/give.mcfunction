# Give Scythe (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Guadaña de Madera", model:"vexp:wooden-scythe", quality:"normal", dmg:3.0, spd:-2.9, combo_dmg:4, combo_cooldown:18, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Guadaña de Piedra", model:"vexp:stone-scythe", quality:"normal", dmg:4.0, spd:-3.2, combo_dmg:6, combo_cooldown:24, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Guadaña de Hueso", model:"vexp:bone-scythe", quality:"normal", dmg:4.0, spd:-3.4, combo_dmg:7, combo_cooldown:36, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Guadaña de Cobre", model:"vexp:copper-scythe", quality:"normal", dmg:4.0, spd:-3.5, combo_dmg:7, combo_cooldown:40, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Guadaña de Hierro", model:"vexp:iron-scythe", quality:"normal", dmg:5.0, spd:-3.6, combo_dmg:8, combo_cooldown:48, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Guadaña de Oro", model:"vexp:golden-scythe", quality:"gold", dmg:3.0, spd:-2.9, combo_dmg:5, combo_cooldown:18, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Guadaña de Diamante", model:"vexp:diamond-scythe", quality:"diamond", dmg:6.0, spd:-3.6, combo_dmg:9, combo_cooldown:54, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Guadaña de Netherite", model:"vexp:netherite-scythe", quality:"netherite", dmg:7.0, spd:-3.7, combo_dmg:10, combo_cooldown:58, right_click_cooldown:36, combo_range:6.0, combo_reach:3.2, reach_mod:0.4, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Guadaña Resonante", model:"vexp:resonance-scythe", quality:"echo", dmg:7.0, spd:-3.6, combo_dmg:10, combo_cooldown:54, right_click_cooldown:36, combo_range:6.0, combo_reach:3.2, reach_mod:0.4, max_damage:1891}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Guadaña Luminiscente", model:"vexp:glowing_scythe", quality:"glowing", dmg:6.0, spd:-3.6, combo_dmg:7, combo_cooldown:36, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.4, max_damage:800}

function vexp:dungeons/weapons/scythe/give_macro with storage vexp:dungeons.weapon params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.bone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
tag @s remove vexp.echo
tag @s remove vexp.glowing
scoreboard players set @s vexp.damage 0
data remove storage vexp:dungeons.weapon params

