# Throw Dagger Logic
# Ejecutado AS @s (jugador) AT @s

tag @s add vexp.projectile_owner
tag @s add vexp.dagger_owner

# Sonido de lanzamiento
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player", pitch:1}
particle minecraft:sweep_attack ^ ^ ^.85 1 1 1 1 0

# Guardar datos del item para el display (opcional, pero mejor pasarlo al proyectil)
tag @s add vexp.throwing

# Crear el proyectil (Armor Stand) con el helper unificado
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.dagger_projectile",proj_type:"dagger",proj_data:{}}
function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Capturar durabilidad actual para persistirla en el proyectil
execute store result score @e[tag=vexp.temp_projectile,distance=..1,limit=1] vexp.damage run data get entity @s SelectedItem.components."minecraft:damage"

# Capturar encantamientos para devolver la daga intacta al recuperarla
execute if data entity @s SelectedItem.components."minecraft:enchantments" run data modify entity @e[tag=vexp.temp_projectile,distance=..1,limit=1] data.enchantments set from entity @s SelectedItem.components."minecraft:enchantments"
execute unless data entity @s SelectedItem.components."minecraft:enchantments" run data modify entity @e[tag=vexp.temp_projectile,distance=..1,limit=1] data.enchantments set value {}

# Identificar material en mano y etiquetar proyectil
# Utilizando la nueva estructura NBT vexp:{item:"dagger"}
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"dagger",material:"bone"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.bone
execute if items entity @s weapon.mainhand iron_sword[custom_data~{vexp:{item:"dagger",material:"iron"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.iron
execute if items entity @s weapon.mainhand wooden_sword[custom_data~{vexp:{item:"dagger",material:"wood"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.wood
execute if items entity @s weapon.mainhand stone_sword[custom_data~{vexp:{item:"dagger",material:"stone"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.stone
execute if items entity @s weapon.mainhand golden_sword[custom_data~{vexp:{item:"dagger",material:"gold"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.gold
execute if items entity @s weapon.mainhand copper_sword[custom_data~{vexp:{item:"dagger",material:"copper"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.copper
execute if items entity @s weapon.mainhand diamond_sword[custom_data~{vexp:{item:"dagger",material:"diamond"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.diamond
execute if items entity @s weapon.mainhand diamond_sword[custom_data~{vexp:{item:"dagger",material:"glowing"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.glowing
execute if items entity @s weapon.mainhand netherite_sword[custom_data~{vexp:{item:"dagger",material:"netherite"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.netherite
execute if items entity @s weapon.mainhand netherite_sword[custom_data~{vexp:{item:"dagger",material:"echo"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.echo
execute if items entity @s weapon.mainhand netherite_sword[custom_data~{vexp:{item:"dagger",material:"amethyst"}}] run tag @e[tag=vexp.temp_projectile,distance=..1] add vexp.amethyst

# Ejecutar spawn del nuevo sistema sobre el proyectil
execute as @e[tag=vexp.temp_projectile,limit=1,distance=..1] at @s run function vexp:projectile/spawn

# Limpiar slot (La daga se consume al lanzarse)
# Limpiamos tanto mainhand como offhand si tienen una daga (para soportar ambas manos)
execute if items entity @s weapon.mainhand *[custom_data~{vexp:{item:"dagger"}}] run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand *[custom_data~{vexp:{item:"dagger"}}] run item replace entity @s weapon.offhand with air

# Quitar tag temporal al lanzador
tag @s remove vexp.throwing
