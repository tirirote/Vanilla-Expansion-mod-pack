# on_attack.mcfunction
# Se ejecuta AS la interaction

# 1. Romper bloque (común)
function vexp:custom_block/break with entity @s data.vexp

# 2. Limpiar data de ataque
data remove entity @s attack
