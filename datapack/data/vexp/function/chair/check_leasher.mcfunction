# Helper: Comprueba si el mob (@s) está atado al jugador actual (marcado con vexp.current_player)
# Devuelve éxito (1) si el dueño de la correa es el jugador correcto.

execute on leasher if entity @s[tag=vexp.current_player] run return 1