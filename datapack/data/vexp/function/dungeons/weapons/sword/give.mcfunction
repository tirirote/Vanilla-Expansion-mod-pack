# Give Sword (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Espada de Madera", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:4.0, spd:-2.333, combo_dmg:3, combo_cooldown:12, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Espada de Piedra", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:-2.75, combo_dmg:4, combo_cooldown:16, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Espada de Hueso", model:"vexp:bone-sword", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:-3.167, combo_dmg:5, combo_cooldown:24, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Espada de Cobre", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:-3.286, combo_dmg:6, combo_cooldown:28, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Espada de Hierro", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:6.0, spd:-3.375, combo_dmg:7, combo_cooldown:32, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Espada de Oro", model:"vexp:none", quality:"gold", combo_type:"short_combo", dmg:4.0, spd:-2.333, combo_dmg:4, combo_cooldown:12, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Espada de Diamante", model:"vexp:none", quality:"diamond", combo_type:"short_combo", dmg:7.0, spd:-3.444, combo_dmg:8, combo_cooldown:36, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:-0.3, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Espada de Netherite", model:"vexp:none", quality:"netherite", combo_type:"mid_combo", dmg:8.0, spd:-3.524, combo_dmg:10, combo_cooldown:42, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:0.0, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Espada Resonante", model:"vexp:resonance-sword", quality:"echo", combo_type:"mid_combo", dmg:8.0, spd:-3.444, combo_dmg:9, combo_cooldown:36, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:0.0, max_damage:1891}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Espada Luminiscente", model:"vexp:glowing_sword", quality:"glowing", combo_type:"mid_combo", dmg:7.0, spd:-3.333, combo_dmg:8, combo_cooldown:30, right_click_cooldown:24, combo_range:2.5, combo_reach:3.5, reach_mod:0.0, max_damage:800}

function vexp:dungeons/weapons/sword/give_macro with storage vexp:dungeons.weapon params

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

