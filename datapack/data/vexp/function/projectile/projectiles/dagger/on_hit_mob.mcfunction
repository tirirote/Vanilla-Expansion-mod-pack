# projectile/on_hit_mob.mcfunction
# Efecto al golpear una entidad
# @s es el proyectil
# @e[tag=vexp.proj_target] es el mob objetivo (ya marcado por el sistema base)

# Pasar tag de material y daño al lanzador para devolver el item
execute if entity @s[tag=vexp.iron] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.iron
execute if entity @s[tag=vexp.wood] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.wood
execute if entity @s[tag=vexp.stone] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.stone
execute if entity @s[tag=vexp.bone] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.bone
execute if entity @s[tag=vexp.gold] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.gold
execute if entity @s[tag=vexp.diamond] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.diamond
execute if entity @s[tag=vexp.copper] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.copper
execute if entity @s[tag=vexp.glowing] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.glowing

execute if entity @s[tag=vexp.netherite] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.netherite
execute if entity @s[tag=vexp.echo] run tag @p[tag=vexp.dagger_owner,limit=1] add vexp.echo

# Quality-specific projectile hooks
execute if entity @s[tag=vexp.netherite] run function vexp:projectile/projectiles/dagger/netherite/on_hit_mob
execute if entity @s[tag=vexp.echo] run function vexp:projectile/projectiles/dagger/echo/on_hit_mob
execute if entity @s[tag=vexp.glowing] run function vexp:projectile/projectiles/dagger/glowing/on_hit_mob

# Efectos visuales
execute unless entity @s[tag=vexp.netherite] unless entity @s[tag=vexp.echo] unless entity @s[tag=vexp.amethyst] positioned ~ ~1 ~ run function vexp:projectile/projectiles/dagger/common_dagger_hit

# Transferir daño al dueño para la devolución con durabilidad correcta
scoreboard players operation @p[tag=vexp.dagger_owner,limit=1] vexp.damage = @s vexp.damage
tag @p[tag=vexp.dagger_owner,limit=1] add vexp.restore_dagger_damage

# Devolver la daga al jugador
execute as @p[tag=vexp.dagger_owner,limit=1] at @s run function vexp:dungeons/dagger/give
