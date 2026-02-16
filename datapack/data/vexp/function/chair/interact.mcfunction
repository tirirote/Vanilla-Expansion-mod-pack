# Ejecutado como la INTERACTION (Silla)
say right
execute if entity @s[tag=vexp.occupied] run return 0

# Marcamos esta silla para que el jugador sepa dónde sentarse
tag @s add vexp.current_chair

# Ejecutamos sit_logic como el jugador (on target)
execute on target run function vexp:chair/sit_logic

# Limpieza de datos
data remove entity @s interaction
tag @s remove vexp.current_chair