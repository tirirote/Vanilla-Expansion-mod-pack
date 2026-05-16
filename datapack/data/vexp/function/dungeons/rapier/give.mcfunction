# Give Rapier (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Estoque de Madera", model:"vexp:wooden-rapier", quality:"normal", dmg:1.0, spd:1.0, combo_dmg:1, combo_cooldown:4, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Estoque de Piedra", model:"vexp:stone-rapier", quality:"normal", dmg:2.0, spd:-0.7, combo_dmg:2, combo_cooldown:6, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Estoque de Hueso", model:"vexp:bone-rapier", quality:"normal", dmg:2.0, spd:-0.7, combo_dmg:2, combo_cooldown:6, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Estoque de Cobre", model:"vexp:copper-rapier", quality:"normal", dmg:2.0, spd:-0.7, combo_dmg:2, combo_cooldown:6, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Estoque de Hierro", model:"vexp:iron-rapier", quality:"normal", dmg:3.0, spd:-1.5, combo_dmg:3, combo_cooldown:8, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Estoque de Oro", model:"vexp:golden-rapier", quality:"gold", dmg:2.0, spd:2.7, combo_dmg:2, combo_cooldown:3, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Estoque de Diamante", model:"vexp:diamond-rapier", quality:"diamond", dmg:4.0, spd:-2.0, combo_dmg:4, combo_cooldown:10, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Estoque de Netherite", model:"vexp:netherite-rapier", quality:"netherite", dmg:5.0, spd:-2.8, combo_dmg:5, combo_cooldown:16, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Estoque Resonante", model:"vexp:resonance-rapier", quality:"echo", dmg:5.0, spd:-2.3, combo_dmg:5, combo_cooldown:12, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:1891}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Estoque Luminiscente", model:"vexp:glowing_rapier", quality:"glowing", dmg:4.0, spd:-2.0, combo_dmg:3, combo_cooldown:9, right_click_cooldown:16, combo_range:1.5, combo_reach:2.8, reach_mod:0.0, max_damage:800}

function vexp:dungeons/rapier/give_macro with storage vexp:dungeons.weapon params

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

