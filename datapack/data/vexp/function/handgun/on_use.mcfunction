# 1. Validación de munición
# damage=6 significa cargador vacío
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{type:"handgun"}},damage=6] run return run function vexp:handgun/empty

tag @s add vexp.handgun.owner

# 2. Generación del ID de la bala
execute unless score @s vexp.id matches 1.. run scoreboard players add #global vexp.id 1
execute unless score @s vexp.id matches 1.. run scoreboard players operation @s vexp.id = #global vexp.id
execute store result storage vexp:temp id int 1 run scoreboard players get @s vexp.id

# 3. Invocación de la "Bala"
function vexp:handgun/summon_macro with storage vexp:temp

#4. Setup de la bala
execute as @e[tag=vexp.handgun.new_bullet,sort=nearest,limit=1,distance=..2] at @s run function vexp:handgun/projectile/setup

# 5. Consumo de bala
function vexp:handgun/consume

# 6. Feedback visual/sonoro extra (opcional si init_bullet ya lo hace)
function vexp:handgun/shoot_effects

# 7. Remover tag
tag @s remove vexp.handgun.owner