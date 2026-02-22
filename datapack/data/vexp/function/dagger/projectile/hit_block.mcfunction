# Projectile Hit Block
# Ejecutado AS @s (marker) AT @s

# Sonido y Partículas de impacto (Dinámico)
execute positioned ^ ^ ^0.85 run function vexp:dagger/projectile/impact_effects

# Spawnear estado "Clavado en Bloque" (Stuck in Block)
summon marker ~ ~ ~ {Tags:["vexp.dagger_stuck","vexp.temp_stuck","vexp.stuck_in_block"]}

# Configurar (Copiamos rotación y TRANSFERIMOS MATERIAL)
execute as @e[tag=vexp.temp_stuck,sort=nearest,limit=1] run tp @s ~ ~-.5 ~ ~ ~
execute if entity @s[tag=vexp.iron] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.iron
execute if entity @s[tag=vexp.wood] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.wood
execute if entity @s[tag=vexp.stone] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.stone
execute if entity @s[tag=vexp.gold] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.gold
execute if entity @s[tag=vexp.diamond] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.diamond
execute if entity @s[tag=vexp.copper] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.copper
execute if entity @s[tag=vexp.netherite] run tag @e[tag=vexp.temp_stuck,sort=nearest,limit=1] add vexp.netherite

data modify entity @e[tag=vexp.temp_stuck,sort=nearest,limit=1] Rotation set from entity @s Rotation

# Transferir daño al marcador stuck
scoreboard players operation @e[tag=vexp.temp_stuck,sort=nearest,limit=1] vexp.damage = @s vexp.damage

execute as @e[tag=vexp.temp_stuck,sort=nearest,limit=1] at @s positioned ~ ~ ~ run function vexp:dagger/stuck/setup


# Matar proyectil
function vexp:dagger/projectile/despawn
