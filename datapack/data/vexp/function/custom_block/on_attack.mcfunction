# on_attack.mcfunction
# Se ejecuta AS la interaction

# 1. Romper bloque (común)
execute unless entity @s[tag=vexp.prevent_break] run function vexp:custom_block/break with entity @s data.vexp
execute if entity @s[tag=vexp.prevent_break] if entity @p[gamemode=creative,limit=1] run function vexp:custom_block/break with entity @s data.vexp

# 2. Limpiar data de ataque
data remove entity @s attack
