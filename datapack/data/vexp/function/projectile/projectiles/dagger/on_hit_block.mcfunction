# projectile/on_hit_block.mcfunction
# Efecto al golpear un bloque
# @s es el proyectil

# Sonido y partículas de impacto
function vexp:utils/sound {sound: "minecraft:item.trident.hit_ground", type: "player", pitch:1}
execute positioned ^ ^ ^1 run function vexp:utils/feedback/block_hit

# Remove only the display linked to this projectile
scoreboard players operation #temp vexp.id = @s vexp.id
execute as @e[type=item_display,tag=vexp.dagger_display,distance=..3] if score @s vexp.id = #temp vexp.id run kill @s

# Spawnear estado "Clavado en Bloque" (Stuck in Block)
summon marker ~ ~ ~ {Tags:["vexp.dagger_stuck","vexp.temp_stuck","vexp.stuck_in_block"]}

# Link stuck marker to projectile by ID
scoreboard players operation @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] vexp.id = #temp vexp.id

# Configurar (Copiamos rotación y TRANSFERIMOS MATERIAL)
execute as @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] run tp @s ~ ~ ~ ~ ~25
execute if entity @s[tag=vexp.iron] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.iron
execute if entity @s[tag=vexp.wood] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.wood
execute if entity @s[tag=vexp.stone] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.stone
execute if entity @s[tag=vexp.bone] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.bone
execute if entity @s[tag=vexp.gold] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.gold
execute if entity @s[tag=vexp.diamond] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.diamond
execute if entity @s[tag=vexp.glowing] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.glowing
execute if entity @s[tag=vexp.copper] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.copper
execute if entity @s[tag=vexp.netherite] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.netherite
execute if entity @s[tag=vexp.echo] run tag @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] add vexp.echo


data modify entity @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] Rotation set from entity @s Rotation

# Transferir daño al marcador stuck
scoreboard players operation @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] vexp.damage = @s vexp.damage

# Transferir encantamientos al marcador stuck para pickup posterior
execute if data entity @s data.enchantments run data modify entity @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] data.enchantments set from entity @s data.enchantments
execute unless data entity @s data.enchantments run data modify entity @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] data.enchantments set value {}

# Quality-specific projectile hooks
execute if entity @s[tag=vexp.netherite] run function vexp:projectile/projectiles/dagger/netherite/on_hit_block
execute if entity @s[tag=vexp.echo] run function vexp:projectile/projectiles/dagger/echo/on_hit_block
execute if entity @s[tag=vexp.glowing] run function vexp:projectile/projectiles/dagger/glowing/on_hit_block
execute if entity @s[tag=vexp.diamond] run function vexp:projectile/projectiles/dagger/diamond/on_hit_block
execute if entity @s[tag=vexp.gold] run function vexp:projectile/projectiles/dagger/gold/on_hit_block

execute as @e[tag=vexp.temp_stuck,sort=nearest,distance=..1,limit=1] at @s run function vexp:projectile/projectiles/dagger/stuck/setup
