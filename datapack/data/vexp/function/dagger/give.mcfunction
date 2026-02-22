# Give Dagger (Common)
# Ejecutado AS @s (jugador)

# 1. Definir datos de material en el mismo objeto 'params' del storage
execute if entity @s[tag=vexp.wood] run data modify storage vexp:main params merge value {damage: 1,item_id:"wooden_sword", name:"Daga de Madera", model:"vexp:wooden_dagger", dmg:1.0, spd:3.0}
execute if entity @s[tag=vexp.stone] run data modify storage vexp:main params merge value {damage: 1,item_id:"stone_sword", name:"Daga de Piedra", model:"vexp:stone_dagger", dmg:2.0, spd:3.0}
execute if entity @s[tag=vexp.iron] run data modify storage vexp:main params merge value {damage: 1,item_id:"iron_sword", name:"Daga de Hierro", model:"vexp:iron_dagger", dmg:4.0, spd:3.0}
execute if entity @s[tag=vexp.gold] run data modify storage vexp:main params merge value {damage: 1,item_id:"golden_sword", name:"Daga de Oro", model:"vexp:golden_dagger", dmg:3.0, spd:4.0}
execute if entity @s[tag=vexp.diamond] run data modify storage vexp:main params merge value {damage: 1,item_id:"diamond_sword", name:"Daga de Diamante", model:"vexp:diamond_dagger", dmg:5.0, spd:3.0}
execute if entity @s[tag=vexp.copper] run data modify storage vexp:main params merge value {damage: 1,item_id:"copper_sword", name:"Daga de Cobre", model:"vexp:copper_dagger", dmg:3.0, spd:3.0}
execute if entity @s[tag=vexp.netherite] run data modify storage vexp:main params merge value {damage: 1,item_id:"netherite_sword", name:"Daga de Netherite", model:"vexp:netherite_dagger", dmg:6.0, spd:4.0}

# 2. Preparar el daño en el objeto storage 'params'
execute store result storage vexp:main params.damage int 1 run scoreboard players get @s vexp.damage

# 3. Llamar a la macro usando el objeto completo de storage
function vexp:dagger/give_macro with storage vexp:main params

# 4. Limpieza
tag @s remove vexp.iron
tag @s remove vexp.wood
tag @s remove vexp.stone
tag @s remove vexp.gold
tag @s remove vexp.diamond
tag @s remove vexp.copper
tag @s remove vexp.netherite
scoreboard players set @s vexp.damage 0
data remove storage vexp:main params

