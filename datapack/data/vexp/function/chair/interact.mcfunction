# Ejecutado como la INTERACTION (Silla)
execute if entity @s[tag=vexp.occupied] run return 0

# Marcamos esta silla para que el jugador o mob sepa dónde sentarse
tag @s add vexp.current_chair

# 1. Identificar al jugador que interactuó
# Asumimos que 'on target' devuelve al jugador (comportamiento normal en datapacks interaction)
execute on target run tag @s add vexp.current_player

# 2. Buscar Mobs Leashed (Atados)
# Buscamos en un radio de 5 bloques si hay algún mob cuya correa pertenezca al jugador actual
tag @e[tag=vexp.sit_candidate,sort=nearest,limit=1,distance=..1] remove vexp.sit_candidate
tag @e[tag=vexp.is_sitting_mob,sort=nearest,distance=..1,limit=1] remove vexp.is_sitting_mob
execute as @e[type=!player,sort=nearest,distance=..5] if function vexp:chair/check_leasher run tag @s add vexp.sit_candidate

# 3. RAMA A: Sentar al Mob (Prioritario)
# Si se encuentra un candidato, lo sentamos
execute as @e[tag=vexp.sit_candidate,sort=nearest,distance=..5,limit=1] run function vexp:chair/sit_mob

# 4. RAMA B: Sentar al Jugador (Secundario)
# Solo si NO hemos encontrado ningún mob candidato
execute unless entity @e[tag=vexp.sit_candidate,sort=nearest,distance=..5,limit=1] as @p[tag=vexp.current_player,limit=1] run function vexp:chair/sit_logic

# 5. Limpieza de tags temporales
tag @p[tag=vexp.current_player,limit=1] remove vexp.current_player
tag @e[tag=vexp.sit_candidate,sort=nearest,distance=..5,limit=1] remove vexp.sit_candidate
tag @s remove vexp.current_chair

# Limpieza de datos
data remove entity @s interaction