# apply_random_motion.mcfunction
# Genera y aplica un movimiento aleatorio entre -1.0 y 1.0 en los ejes X, Y y Z a @s

# 1. Generar valores aleatorios (-100 a 100)
$execute store result score #x vexp.id run random value -$(range)..$(range)
$execute store result score #y vexp.id run random value -$(range)..$(range)
$execute store result score #z vexp.id run random value -$(range)..$(range)

# 2. Aplicar a la entidad con escala 0.01
$execute store result entity @s Motion[0] double $(scale) run scoreboard players get #x vexp.id
$execute store result entity @s Motion[1] double $(scale) run scoreboard players get #y vexp.id
$execute store result entity @s Motion[2] double $(scale) run scoreboard players get #z vexp.id
