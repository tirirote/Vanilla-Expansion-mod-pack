# projectile/on_hit_block.mcfunction
# Efecto al golpear un bloque
# @s es el proyectil

# Sonido y partículas de impacto
function vexp:utils/sound {sound: "minecraft:item.trident.hit_ground", type: "player"}
execute positioned ^ ^ ^1 run function vexp:utils/feedback/block_hit

# Spawnear estado "Clavado en Bloque" (Stuck in Block)
summon marker ~ ~ ~ {Tags:["vexp.dagger_stuck","vexp.temp_stuck","vexp.stuck_in_block"]}

# Configurar (Copiamos rotación y TRANSFERIMOS MATERIAL)
execute as @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] run tp @s ~ ~ ~ ~ ~25
execute if entity @s[tag=vexp.iron] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.iron
execute if entity @s[tag=vexp.wood] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.wood
execute if entity @s[tag=vexp.stone] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.stone
execute if entity @s[tag=vexp.gold] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.gold
execute if entity @s[tag=vexp.diamond] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.diamond
execute if entity @s[tag=vexp.copper] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.copper
execute if entity @s[tag=vexp.netherite] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.netherite

data modify entity @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] Rotation set from entity @s Rotation

# Transferir daño al marcador stuck
scoreboard players operation @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] vexp.damage = @s vexp.damage

execute as @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] at @s run function vexp:dungeons/dagger/stuck/setup
