# projectile/on_hit_mob.mcfunction
# Llamado cuando el proyectil colisiona con una entidad
# @s es el proyectil

# Limpiar residuos previos antes de seleccionar un nuevo objetivo
tag @e[tag=vexp.proj_target] remove vexp.proj_target

# Marcar el objetivo
execute at @s run tag @e[predicate=vexp:is_target,distance=..2,sort=nearest] add vexp.proj_target

# Aplicar daño dinámico desde el NBT
execute store result score #temp vexp.math run data get entity @s data.proj.damage
execute store result storage vexp:temp damage int 1 run scoreboard players get #temp vexp.math

# Identificar al dueño para la atribución (el tag vexp.projectile_owner se quita en projectile/spawn.mcfunction)
scoreboard players operation #owner_id vexp.math = @s vexp.id
execute as @a if score @s vexp.id = #owner_id vexp.math run tag @s add vexp.projectile_owner
data modify storage vexp:temp owner set value "@p[tag=vexp.projectile_owner,limit=1]"

execute as @e[tag=vexp.proj_target] if score #temp vexp.math matches 1.. run function vexp:utils/apply_player_attack_damage with storage vexp:temp

# Hook: Lógica específica del tipo de proyectil
function vexp:projectile/hooks/on_hit_mob with entity @s data

# Limpiar tag temporal
tag @a remove vexp.projectile_owner

# Limpiar tag del objetivo
tag @e[tag=vexp.proj_target] remove vexp.proj_target

# Destruir proyectil (si no se previene por rebote)
execute unless entity @s[tag=vexp.prevent_despawn] run function vexp:projectile/despawn
tag @s remove vexp.prevent_despawn
