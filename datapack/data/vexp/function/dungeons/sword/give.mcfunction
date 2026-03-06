# Give Sword (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:main params merge value {item_id:"wooden_sword", name:"Espada de Madera", dmg:4.0, spd:0.4, combo_dmg:2, combo_cooldown:12, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:main params merge value {item_id:"stone_sword", name:"Espada de Piedra", dmg:5.0, spd:0.2, combo_dmg:4, combo_cooldown:14, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:main params merge value {item_id:"copper_sword", name:"Espada de Cobre", dmg:5.0, spd:-2.4, combo_dmg:5, combo_cooldown:16, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:main params merge value {item_id:"iron_sword", name:"Espada de Hierro", dmg:6.0, spd:-2.5, combo_dmg:6, combo_cooldown:18, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:main params merge value {item_id:"golden_sword", name:"Espada de Oro", dmg:4.0, spd:-2.7, combo_dmg:4, combo_cooldown:20, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:main params merge value {item_id:"diamond_sword", name:"Espada de Diamante", dmg:7.0, spd:-2.9, combo_dmg:8, combo_cooldown:22, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:main params merge value {item_id:"netherite_sword", name:"Espada de Netherite", dmg:8.0, spd:-3.1, combo_dmg:10, combo_cooldown:24, combo_range:5.0, combo_reach:2.8, reach_mod:0.0}

function vexp:dungeons/sword/give_macro with storage vexp:main params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
scoreboard players set @s vexp.damage 0
data remove storage vexp:main params
