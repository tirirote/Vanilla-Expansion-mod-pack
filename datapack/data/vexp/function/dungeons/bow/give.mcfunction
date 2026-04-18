# dungeons/bow/give.mcfunction
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Madera", model:"vexp:wooden_bow", quality:"normal", combo_type:"short_combo", dmg:2.0, spd:-2.8, combo_dmg:4, combo_cooldown:16, combo_range:4.5, combo_reach:3.5, reach_mod:0.0, max_damage:384}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Piedra", model:"vexp:stone_bow", quality:"normal", combo_type:"short_combo", dmg:3.0, spd:-2.9, combo_dmg:5, combo_cooldown:18, combo_range:4.5, combo_reach:3.7, reach_mod:0.0, max_damage:512}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Hueso", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:3.0, spd:-3.0, combo_dmg:6, combo_cooldown:19, combo_range:4.7, combo_reach:3.9, reach_mod:0.0, max_damage:448}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Cobre", model:"vexp:copper_bow", quality:"normal", combo_type:"short_combo", dmg:3.0, spd:-2.9, combo_dmg:6, combo_cooldown:20, combo_range:4.8, combo_reach:4.0, reach_mod:0.0, max_damage:650}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Hierro", model:"vexp:iron_bow", quality:"normal", combo_type:"short_combo", dmg:4.0, spd:-3.0, combo_dmg:7, combo_cooldown:20, combo_range:5.0, combo_reach:4.0, reach_mod:0.0, max_damage:768}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Oro", model:"vexp:golden_bow", quality:"normal", combo_type:"short_combo", dmg:2.0, spd:-2.6, combo_dmg:5, combo_cooldown:14, combo_range:4.5, combo_reach:3.5, reach_mod:0.0, max_damage:256}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Diamante", model:"vexp:diamond_bow", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:-3.0, combo_dmg:8, combo_cooldown:22, combo_range:5.2, combo_reach:4.2, reach_mod:0.0, max_damage:1024}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco de Netherita", model:"vexp:netherite_bow", quality:"netherite", combo_type:"short_combo", dmg:6.0, spd:-3.0, combo_dmg:10, combo_cooldown:24, combo_range:5.5, combo_reach:4.5, reach_mod:0.0, max_damage:1280}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"bow", name:"Arco Resonante", model:"vexp:resonance_bow", quality:"resonance", combo_type:"short_combo", dmg:6.0, spd:-3.0, combo_dmg:11, combo_cooldown:24, combo_range:5.5, combo_reach:4.5, reach_mod:0.0, max_damage:1280}

function vexp:dungeons/bow/give_macro with storage vexp:dungeons.weapon params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.bone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
tag @s remove vexp.echo
scoreboard players set @s vexp.damage 0
data remove storage vexp:dungeons.weapon params
