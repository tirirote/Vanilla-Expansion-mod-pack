# Lógica por Silla (Interaction)
# Se ejecuta AS @s (la silla) AT @s

# 1. Click Derecho (Interact)
execute if data entity @s interaction run function vexp:chair/interact

# 2. Click Izquierdo (Attack/Romper)
# Solo si la entidad sigue existiendo (por si interact borró algo, aunque raro)
execute if entity @s if data entity @s attack run function vexp:chair/pickup

# 3. Limpieza de Estado 'Occupied'
# Si la silla cree estar ocupada pero no tiene montura cerca, se libera.
# Al estar dentro del mismo loop, ahorramos iterar la lista de entidades otra vez.
execute if entity @s[tag=vexp.occupied] unless entity @e[type=armor_stand,tag=vexp.chair_mount,distance=..0.5] run tag @s remove vexp.occupied
