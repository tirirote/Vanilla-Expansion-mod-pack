# Throw Dagger Logic
# Ejecutado AS @s (jugador) AT @s

# Verificamos cooldown
execute if score @s vexp.dagger_cooldown matches 1.. run return 0

tag @s add vexp.projectile_owner
tag @s add vexp.dagger_owner

# Sonido de lanzamiento
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
particle minecraft:sweep_attack ^ ^ ^.85 0 0 0 1 1

# Guardar datos del item para el display (opcional, pero mejor pasarlo al proyectil)
tag @s add vexp.throwing

# Crear el proyectil (Marker) con el nuevo sistema
summon minecraft:marker ~ ~ ~ {Tags:["vexp.projectile","vexp.dagger_projectile","vexp.temp_projectile"],data:{proj_type:"dagger"}}

# Capturar durabilidad (Damage) y añadir 1 por el lanzamiento
execute store result score @e[tag=vexp.temp_projectile,distance=..1,limit=1] vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"

# Identificar material en mano y etiquetar proyectil
# Utilizando la nueva estructura NBT vexp:{item:"dagger"}
execute if items entity @s weapon.mainhand iron_sword[custom_data~{vexp:{item:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.iron
execute if items entity @s weapon.mainhand wooden_sword[custom_data~{vexp:{item:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.wood
execute if items entity @s weapon.mainhand stone_sword[custom_data~{vexp:{item:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.stone
execute if items entity @s weapon.mainhand golden_sword[custom_data~{vexp:{item:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.gold
execute if items entity @s weapon.mainhand diamond_sword[custom_data~{vexp:{item:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.diamond
execute if items entity @s weapon.mainhand copper_sword[custom_data~{vexp:{item:"dagger"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.copper
execute if items entity @s weapon.mainhand netherite_sword[custom_data~{vexp:{item:"dagger",combo:{quality:"netherite"}}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.netherite
execute if items entity @s weapon.mainhand netherite_sword[custom_data~{vexp:{item:"dagger",combo:{quality:"echo"}}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.echo
execute if items entity @s weapon.mainhand netherite_sword[custom_data~{vexp:{item:"dagger",combo:{quality:"amethyst"}}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.amethyst


# Ejecutar spawn del nuevo sistema sobre el proyectil
execute as @e[tag=vexp.temp_projectile,limit=1,distance=..1] at @s run function vexp:projectile/spawn

# Poner cooldown (ejemplo 10 ticks = 0.5s)
scoreboard players set @s vexp.dagger_cooldown 10
scoreboard players set @s vexp.combo_cooldown 10


# Quitar tag temporal al lanzador
tag @s remove vexp.throwing
