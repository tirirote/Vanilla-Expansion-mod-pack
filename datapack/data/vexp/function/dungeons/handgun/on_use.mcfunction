tag @s add vexp.handgun.owner

# 2. Generación del ID de la bala
execute unless score @s vexp.id matches 1.. run scoreboard players add #global vexp.id 1
execute unless score @s vexp.id matches 1.. run scoreboard players operation @s vexp.id = #global vexp.id
execute store result storage vexp:temp id int 1 run scoreboard players get @s vexp.id

# 3. Invocación de la "Bala"
function vexp:dungeons/handgun/spawn

# 5. Consumo de bala en inventario
function vexp:dungeons/handgun/consume

# 6. Feedback visual/sonoro extra
# Efectos de disparo
particle flash{color:-2042981} ^ ^ ^2 0.0 0.0 0.0 0 0
particle minecraft:crit ^ ^ ^2 .25 .25 .25 0.25 5
particle smoke ^ ^ ^2 .2 .2 .2 0.05 3
function vexp:utils/feedback/dust_particle {initialColor: [0.4, 0.4, 0.4], finalColor: [0.8, 0.75, 0.6], scale: 0.8, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 3}
particle minecraft:flame ^ ^ ^2 0.0 0.0 0.0 0.05 1

function vexp:utils/sound {sound: "entity.firework_rocket.launch", type: "player"}
function vexp:utils/sound {sound: "entity.firework_rocket.twinkle_far", type: "player"}

# 7. Remover tag
tag @s remove vexp.handgun.owner
