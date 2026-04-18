# Give Scythe (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"GuadaÃ±a de Madera", model:"vexp:wooden-scythe", quality:"normal", dmg:3.0, spd:-3.0, combo_dmg:4, combo_cooldown:20, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"GuadaÃ±a de Piedra", model:"vexp:stone-scythe", quality:"normal", dmg:4.0, spd:-3.1, combo_dmg:6, combo_cooldown:22, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"GuadaÃ±a de Hueso", model:"vexp:bone-scythe", quality:"normal", dmg:4.0, spd:-3.2, combo_dmg:7, combo_cooldown:24, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"GuadaÃ±a de Cobre", model:"vexp:copper-scythe", quality:"normal", dmg:4.0, spd:-3.2, combo_dmg:7, combo_cooldown:24, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"GuadaÃ±a de Hierro", model:"vexp:iron-scythe", quality:"normal", dmg:5.0, spd:-3.3, combo_dmg:8, combo_cooldown:26, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"GuadaÃ±a de Oro", model:"vexp:golden-scythe", quality:"normal", dmg:3.0, spd:-3.4, combo_dmg:5, combo_cooldown:28, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"GuadaÃ±a de Diamante", model:"vexp:diamond-scythe", quality:"normal", dmg:6.0, spd:-3.5, combo_dmg:9, combo_cooldown:30, right_click_cooldown:36, combo_range:5.5, combo_reach:3.0, reach_mod:0.2, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"GuadaÃ±a de Netherite", model:"vexp:netherite-scythe", quality:"netherite", dmg:7.0, spd:-3.6, combo_dmg:10, combo_cooldown:32, right_click_cooldown:36, combo_range:6.0, combo_reach:3.2, reach_mod:0.4, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"GuadaÃ±a Resonante", model:"vexp:resonance-scythe", quality:"echo", dmg:7.0, spd:-3.6, combo_dmg:10, combo_cooldown:32, right_click_cooldown:36, combo_range:6.0, combo_reach:3.2, reach_mod:0.4, max_damage:1891}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"GuadaÃ±a de Amatista", model:"vexp:amethyst-scythe", quality:"amethyst", dmg:7.0, spd:-3.6, combo_dmg:10, combo_cooldown:32, right_click_cooldown:36, combo_range:6.0, combo_reach:3.2, reach_mod:0.4, max_damage:1351}

function vexp:dungeons/scythe/give_macro with storage vexp:dungeons.weapon params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.bone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
tag @s remove vexp.echo
tag @s remove vexp.amethyst
scoreboard players set @s vexp.damage 0
data remove storage vexp:dungeons.weapon params

