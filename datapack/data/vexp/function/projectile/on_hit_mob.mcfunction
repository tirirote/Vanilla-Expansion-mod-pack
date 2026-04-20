# projectile/on_hit_mob.mcfunction
# Llamado cuando el proyectil colisiona con una entidad
# @s es el proyectil

# Aplicar daño dinámico desde el NBT
execute store result score #temp vexp.math run data get entity @s data.proj.damage
execute store result storage vexp:temp damage int 1 run scoreboard players get #temp vexp.math

# Identificar al dueño para la atribución (el tag vexp.projectile_owner se quita en projectile/spawn.mcfunction)
scoreboard players operation #owner_id vexp.math = @s vexp.id
execute as @a if score @s vexp.id = #owner_id vexp.math run tag @s add vexp.projectile_owner
data modify storage vexp:temp owner set value "@p[tag=vexp.projectile_owner,limit=1]"

execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] if score #temp vexp.math matches 1.. run function vexp:utils/apply_player_attack_damage with storage vexp:temp

#Damage Indicator
execute if score #temp vexp.math matches 1.. run scoreboard players operation #damage vexp.math = #temp vexp.math
data modify storage vexp:temp Damage.color set value "yellow"
data modify storage vexp:temp Damage.bold set value false
data modify storage vexp:temp Damage.prefix set value " -"
data modify storage vexp:temp Damage.suffix set value " "
data modify storage vexp:temp Damage.critical set value 0b
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] if score #temp vexp.math matches 1.. at @s run function vexp:mob_health/spawn_damage

# Hook: Lógica específica del tipo de proyectil
function vexp:projectile/hooks/on_hit_mob with entity @s data

# Limpiar tag temporal
tag @a remove vexp.projectile_owner

# Destruir proyectil (si no se previene por rebote)
execute unless entity @s[tag=vexp.prevent_despawn] run function vexp:projectile/despawn
tag @s remove vexp.prevent_despawn
