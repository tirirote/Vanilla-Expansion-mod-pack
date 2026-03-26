# Give Combat Gloves (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Madera", model:"vexp:wooden-gauntlet", quality:"normal", dmg:1.0, spd:2.6, combo_dmg:1, combo_cooldown:3, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Piedra", model:"vexp:stone-gauntlet", quality:"normal", dmg:2.0, spd:2.4, combo_dmg:2, combo_cooldown:4, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Cobre", model:"vexp:copper-gauntlet", quality:"normal", dmg:2.0, spd:2.2, combo_dmg:2, combo_cooldown:5, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Hierro", model:"vexp:iron-gauntlet", quality:"normal", dmg:3.0, spd:2.0, combo_dmg:3, combo_cooldown:6, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Oro", model:"vexp:golden-gauntlet", quality:"normal", dmg:2.0, spd:1.8, combo_dmg:2, combo_cooldown:7, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Diamante", model:"vexp:diamond-gauntlet", quality:"normal", dmg:4.0, spd:1.6, combo_dmg:4, combo_cooldown:8, combo_range:2.5, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Netherite", model:"vexp:netherite-gauntlet", quality:"netherite", dmg:5.0, spd:1.4, combo_dmg:5, combo_cooldown:9, combo_range:3.0, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes Resonantes", model:"vexp:resonance-gauntlet", quality:"echo", dmg:5.0, spd:1.4, combo_dmg:5, combo_cooldown:9, combo_range:3.0, combo_reach:2.5, reach_mod:-0.3}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:main params merge value {item_id:"stick", name:"Guantes de Amatista", model:"vexp:amethyst-gauntlet", quality:"amethyst", dmg:5.0, spd:1.4, combo_dmg:5, combo_cooldown:9, combo_range:3.0, combo_reach:2.5, reach_mod:-0.3}

function vexp:dungeons/gauntlets/give_macro with storage vexp:main params

tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
tag @s remove vexp.echo
tag @s remove vexp.amethyst
scoreboard players set @s vexp.damage 0
data remove storage vexp:main params
