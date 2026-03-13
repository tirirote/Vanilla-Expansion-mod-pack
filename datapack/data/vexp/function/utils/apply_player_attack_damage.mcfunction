# utils/apply_player_attack_damage.mcfunction
# Macro que aplica daño de ataque de jugador
# $(damage) - Cantidad de daño a aplicar  
# $(owner) - Selector del jugador atacante (ej: "@p[tag=vexp.dagger_owner,limit=1]")
# @s debe ser el mob que recibirá el daño

$damage @s $(damage) minecraft:player_attack by $(owner)
