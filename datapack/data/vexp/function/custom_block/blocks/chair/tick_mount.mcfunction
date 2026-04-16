# Se ejecuta AS una montura de silla.

# Si una montura temporal ya tiene pasajero, se promueve a montura estable.
execute if entity @s[tag=vexp.temp] if data entity @s Passengers run tag @s remove vexp.temp

# Limpiar monturas temporales vacias solo si no hay una silla cercana.
# Esto evita matar la montura en la ventana entre summon y ride.
execute if entity @s[tag=vexp.temp] unless data entity @s Passengers unless entity @e[type=interaction,tag=vexp.chair_interact,distance=..2,limit=1] run kill @s

# Si no tiene pasajeros y ya no es temporal, eliminar.
execute if entity @s[tag=!vexp.temp] unless data entity @s Passengers run kill @s
