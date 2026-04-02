# Give Dagger (Common)
# Ejecutado AS @s (jugador)

# 1. Definir datos de material en el mismo objeto 'params' del storage
# Stats de combo base para dagas: cooldown:3, range:0.8, reach:1.5
execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Daga de Madera", model:"vexp:wooden_dagger", quality:"normal", dmg:2.0, spd:2.6, combo_dmg:2, combo_cooldown:2, combo_range:0.8, combo_reach:2.0, reach_mod:-1.0}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Daga de Piedra", model:"vexp:stone_dagger", quality:"normal", dmg:2.0, spd:2.4, combo_dmg:2, combo_cooldown:3, combo_range:0.8, combo_reach:2.0, reach_mod:-1.0}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Daga de Cobre", model:"vexp:copper_dagger", quality:"normal", dmg:3.0, spd:2.2, combo_dmg:3, combo_cooldown:4, combo_range:0.8, combo_reach:2.0, reach_mod:-1.0}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Daga de Hierro", model:"vexp:iron_dagger", quality:"normal", dmg:4.0, spd:2.0, combo_dmg:4, combo_cooldown:5, combo_range:0.8, combo_reach:2.0, reach_mod:-1.0}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Daga de Oro", model:"vexp:golden_dagger", quality:"normal", dmg:3.0, spd:1.8, combo_dmg:3, combo_cooldown:6, combo_range:0.8, combo_reach:2.0, reach_mod:-1.0}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Daga de Diamante", model:"vexp:diamond_dagger", quality:"normal", dmg:5.0, spd:1.6, combo_dmg:5, combo_cooldown:7, combo_range:0.8, combo_reach:2.5, reach_mod:-0.5}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Daga de Netherite", model:"vexp:netherite_dagger", quality:"netherite", dmg:6.0, spd:1.4, combo_dmg:6, combo_cooldown:8, combo_range:1.0, combo_reach:2.5, reach_mod:-0.5}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Daga Resonante", model:"vexp:resonance_dagger", quality:"echo", dmg:6.0, spd:1.4, combo_dmg:6, combo_cooldown:8, combo_range:1.0, combo_reach:2.5, reach_mod:-0.5}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Daga de Amatista", model:"vexp:amethyst_dagger", quality:"amethyst", dmg:6.0, spd:1.4, combo_dmg:6, combo_cooldown:8, combo_range:1.0, combo_reach:2.5, reach_mod:-0.5}

# 2. Llamar a la macro usando el objeto completo de storage
function vexp:dungeons/dagger/give_macro with storage vexp:dungeons.weapon params

# 3. Limpieza
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
