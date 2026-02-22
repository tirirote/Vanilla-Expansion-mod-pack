# Projectile Hit Mob
# Ejecutado AS el proyectil (marker) AT el proyectil
# El mob es @e[distance=..1.5,limit=1] etc. Pero vamos a identificarlo mejor en la llamada.

# Identificar mob impactado
tag @e[type=!player,type=!item_display,type=!interaction,type=!marker,distance=..2,limit=1,sort=nearest] add vexp.dagger_target

# Daño inicial dinámico
execute if entity @s[tag=vexp.wood] as @e[tag=vexp.dagger_target,limit=1] run damage @s 2 minecraft:player_attack by @p[tag=vexp.dagger_owner]
execute if entity @s[tag=vexp.stone] as @e[tag=vexp.dagger_target,limit=1] run damage @s 3 minecraft:player_attack by @p[tag=vexp.dagger_owner]
execute if entity @s[tag=vexp.iron] as @e[tag=vexp.dagger_target,limit=1] run damage @s 4 minecraft:player_attack by @p[tag=vexp.dagger_owner]
execute if entity @s[tag=vexp.gold] as @e[tag=vexp.dagger_target,limit=1] run damage @s 2 minecraft:player_attack by @p[tag=vexp.dagger_owner]
execute if entity @s[tag=vexp.diamond] as @e[tag=vexp.dagger_target,limit=1] run damage @s 5 minecraft:player_attack by @p[tag=vexp.dagger_owner]

# Pasar tag de material y daño al lanzador
execute if entity @s[tag=vexp.iron] run tag @p[tag=vexp.dagger_owner] add vexp.iron
execute if entity @s[tag=vexp.wood] run tag @p[tag=vexp.dagger_owner] add vexp.wood
execute if entity @s[tag=vexp.stone] run tag @p[tag=vexp.dagger_owner] add vexp.stone
execute if entity @s[tag=vexp.gold] run tag @p[tag=vexp.dagger_owner] add vexp.gold
execute if entity @s[tag=vexp.diamond] run tag @p[tag=vexp.dagger_owner] add vexp.diamond
execute if entity @s[tag=vexp.copper] run tag @p[tag=vexp.dagger_owner] add vexp.copper
execute if entity @s[tag=vexp.netherite] run tag @p[tag=vexp.dagger_owner] add vexp.netherite

# Transferir daño al dueño para la devolución
scoreboard players operation @p[tag=vexp.dagger_owner,limit=1] vexp.damage = @s vexp.damage

execute as @p[tag=vexp.dagger_owner,limit=1] at @s run function vexp:dagger/give


# Matar proyectil
function vexp:dagger/projectile/despawn
