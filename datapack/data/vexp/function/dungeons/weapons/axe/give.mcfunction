# Give Axe (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_axe", name:"Hacha de Madera", model:"vexp:none", quality:"normal", dmg:7.0, spd:-2, combo_dmg:4, combo_cooldown:10, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_axe", name:"Hacha de Piedra", model:"vexp:none", quality:"normal", dmg:9.0, spd:-2.75, combo_dmg:5, combo_cooldown:16, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_axe", name:"Hacha de Hueso", model:"vexp:none", quality:"normal", dmg:9.0, spd:-3, combo_dmg:6, combo_cooldown:20, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_axe", name:"Hacha de Cobre", model:"vexp:none", quality:"normal", dmg:9.0, spd:-3.167, combo_dmg:7, combo_cooldown:24, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_axe", name:"Hacha de Hierro", model:"vexp:none", quality:"normal", dmg:10.0, spd:-3.286, combo_dmg:8, combo_cooldown:28, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_axe", name:"Hacha de Oro", model:"vexp:none", quality:"gold", dmg:7.0, spd:-2, combo_dmg:4, combo_cooldown:10, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_axe", name:"Hacha de Diamante", model:"vexp:none", quality:"diamond", dmg:11.0, spd:-3.375, combo_dmg:9, combo_cooldown:32, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.3, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_axe", name:"Hacha de Netherite", model:"vexp:none", quality:"netherite", dmg:12.0, spd:-3.444, combo_dmg:11, combo_cooldown:36, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.0, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_axe", model:"vexp:resonance-axe", name:"Hacha Resonante", quality:"echo", dmg:12.0, spd:-3.375, combo_dmg:10, combo_cooldown:32, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.0, max_damage:1891}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_axe", model:"vexp:glowing_axe", name:"Hacha Luminiscente", quality:"glowing", dmg:10.0, spd:-3.286, combo_dmg:9, combo_cooldown:28, right_click_cooldown:12, combo_range:1.25, combo_reach:2.5, reach_mod:-1.0, max_damage:800}

function vexp:dungeons/weapons/axe/give_macro with storage vexp:dungeons.weapon params

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
tag @s remove vexp.amethyst
scoreboard players set @s vexp.damage 0
data remove storage vexp:dungeons.weapon params

