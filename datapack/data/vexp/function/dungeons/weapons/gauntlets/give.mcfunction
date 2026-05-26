# Give Combat Gloves (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:wooden_sword", name:"Guantes de Madera", model:"vexp:wooden-gauntlet", quality:"normal", dmg:1.0, spd:6.0, combo_dmg:1, combo_cooldown:2, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:stone_sword", name:"Guantes de Piedra", model:"vexp:stone-gauntlet", quality:"normal", dmg:2.0, spd:1.0, combo_dmg:2, combo_cooldown:4, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:iron_sword", name:"Guantes de Hueso", model:"vexp:bone-gauntlet", quality:"normal", dmg:2.0, spd:0.0, combo_dmg:2, combo_cooldown:5, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:copper_sword", name:"Guantes de Cobre", model:"vexp:copper-gauntlet", quality:"normal", dmg:2.0, spd:0.0, combo_dmg:2, combo_cooldown:5, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:iron_sword", name:"Guantes de Hierro", model:"vexp:iron-gauntlet", quality:"normal", dmg:3.0, spd:-0.7, combo_dmg:3, combo_cooldown:6, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:golden_sword", name:"Guantes de Oro", model:"vexp:golden-gauntlet", quality:"gold", dmg:2.0, spd:6.0, combo_dmg:2, combo_cooldown:2, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:diamond_sword", name:"Guantes de Diamante", model:"vexp:diamond-gauntlet", quality:"diamond", dmg:4.0, spd:-1.5, combo_dmg:4, combo_cooldown:8, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:netherite_sword", name:"Guantes de Netherite", model:"vexp:netherite-gauntlet", quality:"netherite", dmg:5.0, spd:-2.0, combo_dmg:5, combo_cooldown:10, right_click_cooldown:30, combo_range:3.0, combo_reach:2.5, reach_mod:-0.3, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:netherite_sword", name:"Guantes Resonantes", model:"vexp:resonance-gauntlet", quality:"echo", dmg:5.0, spd:-2.0, combo_dmg:5, combo_cooldown:10, right_click_cooldown:30, combo_range:3.0, combo_reach:2.5, reach_mod:-0.3, max_damage:1891}
execute if entity @s[tag=vexp.glowing] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:diamond_sword", name:"Guantes Luminiscentes", model:"vexp:glowing_gauntlet", quality:"glowing", dmg:4.0, spd:-1.5, combo_dmg:3, combo_cooldown:8, right_click_cooldown:30, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3, max_damage:800}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:dungeons.weapon params merge value {item_id:"minecraft:netherite_sword", name:"Guantes de Amatista", model:"vexp:amethyst-gauntlet", quality:"diamond", dmg:5.0, spd:-1.5, combo_dmg:5, combo_cooldown:8, right_click_cooldown:30, combo_range:3.0, combo_reach:2.5, reach_mod:-0.3, max_damage:1351}

function vexp:dungeons/weapons/gauntlets/give_macro with storage vexp:dungeons.weapon params

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

