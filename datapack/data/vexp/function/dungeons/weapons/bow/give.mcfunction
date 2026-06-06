# dungeons/bow/give.mcfunction
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Madera", model:"vexp:wooden_bow", quality:"normal", combo_type:"short_combo", dmg:2.0, spd:-2.8, combo_dmg:4, combo_cooldown:16, right_click_cooldown:20, combo_range:4.5, combo_reach:3.5, reach_mod:0.0, max_damage:384}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Piedra", model:"vexp:stone_bow", quality:"normal", combo_type:"short_combo", dmg:3.0, spd:-2, combo_dmg:3, combo_cooldown:10, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:512}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Hueso", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:3.0, spd:-2.333, combo_dmg:4, combo_cooldown:12, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:448}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Cobre", model:"vexp:copper_bow", quality:"normal", combo_type:"short_combo", dmg:3.0, spd:-2.571, combo_dmg:5, combo_cooldown:14, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:650}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Hierro", model:"vexp:iron_bow", quality:"normal", combo_type:"short_combo", dmg:4.0, spd:-2.889, combo_dmg:5, combo_cooldown:18, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:768}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Oro", model:"vexp:golden_bow", quality:"gold", combo_type:"short_combo", dmg:2.0, spd:-2.667, combo_dmg:3, combo_cooldown:15, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:256}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Diamante", model:"vexp:diamond_bow", quality:"diamond", combo_type:"short_combo", dmg:5.0, spd:-3.091, combo_dmg:6, combo_cooldown:22, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:1024}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Netherita", model:"vexp:netherite_bow", quality:"netherite", combo_type:"short_combo", dmg:6.0, spd:-2.667, combo_dmg:7, combo_cooldown:15, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:1280}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco Resonante", model:"vexp:resonance_bow", quality:"echo", combo_type:"short_combo", dmg:6.0, spd:-2.667, combo_dmg:9, combo_cooldown:15, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:1280}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco Luminiscente", model:"vexp:glowing_bow", quality:"glowing", combo_type:"short_combo", dmg:5.0, spd:-2.333, combo_dmg:6, combo_cooldown:12, right_click_cooldown:20, combo_range:1.5, combo_reach:3.5, reach_mod:0.0, max_damage:800}

function vexp:dungeons/weapons/bow/give_macro with storage vexp:dungeons.weapon params

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
