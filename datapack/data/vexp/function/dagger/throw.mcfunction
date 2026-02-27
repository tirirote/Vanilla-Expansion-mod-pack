# Throw Dagger Logic
# Ejecutado AS @s (jugador) AT @s

# Verificamos cooldown
execute if score @s vexp.dagger_cooldown matches 1.. run return 0

tag @s add vexp.dagger_owner

# Sonido de lanzamiento
playsound minecraft:item.trident.throw player @a ~ ~ ~ 0.5 1.5

particle minecraft:sweep_attack ^ ^ ^.85 0 0 0 1 1

# Guardar datos del item para el display (opcional, pero mejor pasarlo al proyectil)
# En este caso, usaremos un tag para saber material
tag @s add vexp.throwing

# Crear el proyectil (Marker)
# Lo spawneamos a la altura de los ojos
summon minecraft:marker ~ ~ ~ {Tags:["vexp.temp_projectile"]}

# Capturar durabilidad (Damage) y añadir 1 por el lanzamiento
execute store result score @e[tag=vexp.temp_projectile,distance=..1,limit=1] vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"

# Identificar material en mano y etiquetar proyectil
execute if items entity @s weapon.mainhand iron_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.iron
execute if items entity @s weapon.mainhand wooden_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.wood
execute if items entity @s weapon.mainhand stone_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.stone
execute if items entity @s weapon.mainhand golden_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.gold
execute if items entity @s weapon.mainhand diamond_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.diamond
execute if items entity @s weapon.mainhand copper_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.copper
execute if items entity @s weapon.mainhand netherite_sword[custom_data={vexp:{type:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.netherite


# Ejecutar setup sobre el proyectil
execute as @e[tag=vexp.temp_projectile,limit=1,distance=..1] at @s run function vexp:dagger/projectile/setup

# Poner cooldown (ejemplo 10 ticks = 0.5s)
scoreboard players set @s vexp.dagger_cooldown 10

# Quitar tag temporal al lanzador
tag @s remove vexp.throwing
