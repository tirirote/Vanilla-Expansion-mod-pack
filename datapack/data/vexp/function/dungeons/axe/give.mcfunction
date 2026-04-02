# Give Axe (Common)
# Ejecutado AS @s (jugador)

execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_axe", name:"Hacha de Madera", model:"vexp:none", quality:"normal", dmg:7.0, spd:-2.0, combo_dmg:5, combo_cooldown:14, combo_range:3.0, combo_reach:1.5, reach_mod:-1.3}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_axe", name:"Hacha de Piedra", model:"vexp:none", quality:"normal", dmg:9.0, spd:-2.2, combo_dmg:8, combo_cooldown:16, combo_range:3.0, combo_reach:1.5, reach_mod:-1.3}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_axe", name:"Hacha de Cobre", model:"vexp:none", quality:"normal", dmg:9.0, spd:-2.4, combo_dmg:9, combo_cooldown:18, combo_range:3.0, combo_reach:1.5, reach_mod:-1.3}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_axe", name:"Hacha de Hierro", model:"vexp:none", quality:"normal", dmg:10.0, spd:-2.6, combo_dmg:10, combo_cooldown:20, combo_range:3.0, combo_reach:1.5, reach_mod:-1.3}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_axe", name:"Hacha de Oro", model:"vexp:none", quality:"normal", dmg:7.0, spd:-2.8, combo_dmg:7, combo_cooldown:22, combo_range:3.0, combo_reach:1.5, reach_mod:-1.3}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_axe", name:"Hacha de Diamante", model:"vexp:none", quality:"normal", dmg:11.0, spd:-3.0, combo_dmg:12, combo_cooldown:24, combo_range:3.0, combo_reach:1.5, reach_mod:-1.3}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_axe", name:"Hacha de Netherite", model:"vexp:none", quality:"netherite", dmg:12.0, spd:-3.2, combo_dmg:14, combo_cooldown:26, combo_range:3.5, combo_reach:1.8, reach_mod:-1.0}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_axe", model:"vexp:resonance-axe", name:"Hacha Resonante", quality:"echo", dmg:12.0, spd:-3.2, combo_dmg:14, combo_cooldown:26, combo_range:3.5, combo_reach:1.8, reach_mod:-1.0}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_axe", model:"vexp:amethyst-axe", name:"Hacha de Amatista", quality:"amethyst", dmg:12.0, spd:-3.2, combo_dmg:14, combo_cooldown:26, combo_range:3.5, combo_reach:1.8, reach_mod:-1.0}

function vexp:dungeons/axe/give_macro with storage vexp:dungeons.weapon params

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
data remove storage vexp:dungeons.weapon params
