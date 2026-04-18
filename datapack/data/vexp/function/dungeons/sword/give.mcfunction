# Give Sword (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Espada de Madera", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:4.0, spd:0.4, combo_dmg:2, combo_cooldown:12, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Espada de Piedra", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:0.2, combo_dmg:4, combo_cooldown:14, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Espada de Hueso", model:"vexp:bone-sword", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:-2.4, combo_dmg:5, combo_cooldown:16, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Espada de Cobre", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:5.0, spd:-2.4, combo_dmg:5, combo_cooldown:16, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Espada de Hierro", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:6.0, spd:-2.5, combo_dmg:6, combo_cooldown:18, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Espada de Oro", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:4.0, spd:-2.7, combo_dmg:4, combo_cooldown:20, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Espada de Diamante", model:"vexp:none", quality:"normal", combo_type:"short_combo", dmg:7.0, spd:-2.9, combo_dmg:8, combo_cooldown:22, combo_range:4.5, combo_reach:2.5, reach_mod:-0.3, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Espada de Netherite", model:"vexp:none", quality:"netherite", combo_type:"mid_combo", dmg:8.0, spd:-3.1, combo_dmg:10, combo_cooldown:24, combo_range:5.0, combo_reach:2.8, reach_mod:0.0, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Espada Resonante", model:"vexp:resonance-sword", quality:"echo", combo_type:"mid_combo", dmg:8.0, spd:-3.1, combo_dmg:10, combo_cooldown:24, combo_range:5.0, combo_reach:2.8, reach_mod:0.0, max_damage:1891}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Espada de Amatista", model:"vexp:amethyst-sword", quality:"amethyst", combo_type:"mid_combo", dmg:8.0, spd:-3.1, combo_dmg:10, combo_cooldown:24, combo_range:5.0, combo_reach:2.8, reach_mod:0.0, max_damage:1351}

function vexp:dungeons/sword/give_macro with storage vexp:dungeons.weapon params

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

