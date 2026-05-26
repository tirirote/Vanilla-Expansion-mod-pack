tag @s add vexp.handgun.owner

# 2. Generación del ID de la bala
execute unless score @s vexp.id matches 1.. run scoreboard players add #global vexp.id 1
execute unless score @s vexp.id matches 1.. run scoreboard players operation @s vexp.id = #global vexp.id
execute store result storage vexp:temp id int 1 run scoreboard players get @s vexp.id

# 3. Invocación de la "Bala"
function vexp:dungeons/weapons/handgun/spawn

# 5. Consumo de bala en inventario
function vexp:dungeons/weapons/handgun/consume

# 6. Feedback visual/sonoro extra
# Efectos de disparo
particle flash{color:-2042981} ^ ^ ^1 0.0 0.0 0.0 0 0
particle minecraft:crit ^ ^ ^1.5 .25 .25 .25 0.25 5
particle large_smoke ^ ^ ^1.5 .2 .2 .2 0.01 1
particle minecraft:flame ^ ^ ^1.5 0.0 0.0 0.0 0.05 1

function vexp:utils/sound {sound: "entity.firework_rocket.launch", type: "player"}
function vexp:utils/sound {sound: "entity.firework_rocket.twinkle_far", type: "player"}

# 7. Remover tag
tag @s remove vexp.handgun.owner
