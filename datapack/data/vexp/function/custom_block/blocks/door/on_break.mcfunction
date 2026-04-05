# on_break.mcfunction
# Ejecutar AS la interaction de la puerta

# Remover tag de cerrado
tag @s remove vexp.door_closed
tag @s remove vexp.door_pending_close

# Limpieza defensiva de puerta fisica
execute if block ~ ~ ~ iron_door run setblock ~ ~ ~ air strict
execute if block ~ ~1 ~ iron_door run setblock ~ ~1 ~ air strict
