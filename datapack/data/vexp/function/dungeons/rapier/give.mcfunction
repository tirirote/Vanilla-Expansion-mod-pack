# Give Rapier (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:main params merge value {item_id:"wooden_sword", name:"Estoque de Madera", model:"vexp:wooden-rapier", dmg:1.0, spd:0.4, combo_dmg:1, combo_cooldown:4, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:main params merge value {item_id:"stone_sword", name:"Estoque de Piedra", model:"vexp:stone-rapier", dmg:2.0, spd:0.2, combo_dmg:2, combo_cooldown:5, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:main params merge value {item_id:"copper_sword", name:"Estoque de Cobre", model:"vexp:copper-rapier", dmg:2.0, spd:0.0, combo_dmg:2, combo_cooldown:6, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:main params merge value {item_id:"iron_sword", name:"Estoque de Hierro", model:"vexp:iron-rapier", dmg:3.0, spd:-0.2, combo_dmg:3, combo_cooldown:7, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:main params merge value {item_id:"golden_sword", name:"Estoque de Oro", model:"vexp:golden-rapier", dmg:2.0, spd:-0.4, combo_dmg:2, combo_cooldown:8, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:main params merge value {item_id:"diamond_sword", name:"Estoque de Diamante", model:"vexp:diamond-rapier", dmg:4.0, spd:-0.6, combo_dmg:4, combo_cooldown:9, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:main params merge value {item_id:"netherite_sword", name:"Estoque de Netherite", model:"vexp:netherite-rapier", dmg:5.0, spd:-0.8, combo_dmg:5, combo_cooldown:10, combo_range:1.5, combo_reach:2.8, reach_mod:0.0}

function vexp:dungeons/rapier/give_macro with storage vexp:main params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
scoreboard players set @s vexp.damage 0
data remove storage vexp:main params
