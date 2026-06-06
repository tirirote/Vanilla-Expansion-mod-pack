# Give Spear (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Lanza de Madera", model:"vexp:none", quality:"normal", combo_type:"mid_combo", dmg:3.0, spd:-2.889, combo_dmg:2, combo_cooldown:18, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.3, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Lanza de Piedra", model:"vexp:none", quality:"normal", combo_type:"mid_combo", dmg:4.0, spd:-3.091, combo_dmg:3, combo_cooldown:22, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.3, max_damage:131}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Lanza de Cobre", model:"vexp:none", quality:"normal", combo_type:"mid_combo", dmg:5.0, spd:-3.231, combo_dmg:4, combo_cooldown:26, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.3, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Lanza de Hierro", model:"vexp:none", quality:"normal", combo_type:"mid_combo", dmg:7.0, spd:-3.375, combo_dmg:5, combo_cooldown:32, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.5, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Lanza Dorada", model:"vexp:none", quality:"gold", combo_type:"mid_combo", dmg:4.0, spd:-2.571, combo_dmg:4, combo_cooldown:14, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.3, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Lanza de Diamante", model:"vexp:none", quality:"diamond", combo_type:"mid_combo", dmg:8.0, spd:-3.474, combo_dmg:6, combo_cooldown:38, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.5, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Lanza de Netherite", model:"vexp:none", quality:"netherite", combo_type:"mid_combo", dmg:10.0, spd:-3.524, combo_dmg:11, combo_cooldown:42, right_click_cooldown:28, combo_range:4, combo_reach:5, reach_mod:0.8, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Lanza Resonante", model:"vexp:resonance_spear", quality:"echo", combo_type:"mid_combo", dmg:10.0, spd:-3.5, combo_dmg:12, combo_cooldown:40, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.8, max_damage:1891}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Lanza Luminiscente", model:"vexp:glowing_spear", quality:"glowing", combo_type:"mid_combo", dmg:8.0, spd:-3.375, combo_dmg:9, combo_cooldown:32, right_click_cooldown:28, combo_range:1.75, combo_reach:6, reach_mod:0.5, max_damage:800}

function vexp:dungeons/weapons/spear/give_macro with storage vexp:dungeons.weapon params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.copper
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.netherite
tag @s remove vexp.echo
tag @s remove vexp.glowing
scoreboard players set @s vexp.damage 0
data remove storage vexp:dungeons.weapon params
