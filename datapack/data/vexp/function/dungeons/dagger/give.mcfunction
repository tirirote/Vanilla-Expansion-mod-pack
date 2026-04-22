# Give Dagger (Common)
# Ejecutado AS @s (jugador)

# 1. Definir datos de material en el mismo objeto 'params' del storage
# Stats de combo base para dagas: cooldown:3, range:0.8, reach:1.5
execute if entity @s[tag=vexp.wood] run data modify storage vexp:dungeons.weapon params merge value {item_id:"wooden_sword", name:"Daga de Madera", model:"vexp:wooden_dagger", material:"wood", quality:"normal", dmg:2.0, spd:6.0, combo_dmg:2, combo_cooldown:2, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-1.0, max_damage:59}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"stone_sword", name:"Daga de Piedra", model:"vexp:stone_dagger", material:"stone", quality:"normal", dmg:2.0, spd:2.7, combo_dmg:2, combo_cooldown:3, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-1.0, max_damage:131}
execute if entity @s[tag=vexp.bone] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Daga de Hueso", model:"vexp:bone_dagger", material:"bone", quality:"normal", dmg:3.0, spd:1.0, combo_dmg:3, combo_cooldown:4, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-1.0, max_damage:96}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:dungeons.weapon params merge value {item_id:"copper_sword", name:"Daga de Cobre", model:"vexp:copper_dagger", material:"copper", quality:"normal", dmg:3.0, spd:0.0, combo_dmg:3, combo_cooldown:5, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-1.0, max_damage:250}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:dungeons.weapon params merge value {item_id:"iron_sword", name:"Daga de Hierro", model:"vexp:iron_dagger", material:"iron", quality:"normal", dmg:4.0, spd:-0.7, combo_dmg:4, combo_cooldown:6, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-1.0, max_damage:250}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:dungeons.weapon params merge value {item_id:"golden_sword", name:"Daga de Oro", model:"vexp:golden_dagger", material:"gold", quality:"gold", dmg:3.0, spd:6.0, combo_dmg:3, combo_cooldown:2, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-1.0, max_damage:32}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:dungeons.weapon params merge value {item_id:"diamond_sword", name:"Daga de Diamante", model:"vexp:diamond_dagger", material:"diamond", quality:"diamond", dmg:5.0, spd:-1.1, combo_dmg:5, combo_cooldown:7, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-0.5, max_damage:1561}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Daga de Netherite", model:"vexp:netherite_dagger", material:"netherite", quality:"netherite", dmg:6.0, spd:-2.0, combo_dmg:6, combo_cooldown:10, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-0.5, max_damage:2031}
execute if entity @s[tag=vexp.echo] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Daga Resonante", model:"vexp:resonance_dagger", material:"echo", quality:"echo", dmg:6.0, spd:-1.1, combo_dmg:6, combo_cooldown:7, right_click_cooldown:12, combo_range:1.5, combo_reach:1.5, reach_mod:-0.5, max_damage:1891}
execute if entity @s[tag=vexp.amethyst] run data modify storage vexp:dungeons.weapon params merge value {item_id:"netherite_sword", name:"Daga de Amatista", model:"vexp:amethyst_dagger", material:"amethyst", quality:"diamond", dmg:6.0, spd:-1.1, combo_dmg:6, combo_cooldown:7, right_click_cooldown:12, combo_range:1.0, combo_reach:2.5, reach_mod:-0.5, max_damage:1351}

# Restaurar damage desde scoreboard solo cuando la daga viene de un proyectil recogido
execute if entity @s[tag=vexp.restore_dagger_damage] store result storage vexp:dungeons.weapon params.item_damage int 1 run scoreboard players get @s vexp.damage
execute unless entity @s[tag=vexp.restore_dagger_damage] run data modify storage vexp:dungeons.weapon params.item_damage set value 0

# 2. Llamar a la macro usando el objeto completo de storage
function vexp:dungeons/dagger/give_macro with storage vexp:dungeons.weapon params

# 3. Limpieza
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
tag @s remove vexp.restore_dagger_damage
scoreboard players set @s vexp.damage 0
data remove storage vexp:dungeons.weapon params
