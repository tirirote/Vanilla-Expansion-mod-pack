# projectile/on_hit_block.mcfunction
# Llamado cuando el proyectil colisiona con un bloque
# @s es el proyectil

# Hook: Lógica específica del tipo de proyectil
function vexp:projectile/hooks/on_hit_block with entity @s data

# Redstone Interactions
execute positioned ^ ^ ^0.25 run function vexp:projectile/utils/redstone_interaction

# Other Interactions
execute positioned ^ ^ ^0.25 run function vexp:projectile/utils/other_interactions

# Destruir proyectil (si no se previene por rebote/retorno)
execute unless entity @s[tag=vexp.prevent_despawn] run function vexp:projectile/despawn
tag @s remove vexp.prevent_despawn
