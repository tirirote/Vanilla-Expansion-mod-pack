# 1. Identificar al jugador y guardar ID
execute on target run tag @s add vexp.picker
execute on attacker run tag @s add vexp.picker
execute at @s as @p[distance=..1,limit=1] run tag @s add vexp.picker

scoreboard players operation #temp vexp.id = @s vexp.id

# 2. Seleccionar el marker stuck exacto por ID
execute as @e[tag=vexp.dagger_stuck] if score @s vexp.id = #temp vexp.id run tag @s add vexp.current_pickup

# Pasar material del marker seleccionado al picker para el give
execute if entity @e[tag=vexp.current_pickup,tag=vexp.iron,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.iron
execute if entity @e[tag=vexp.current_pickup,tag=vexp.wood,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.wood
execute if entity @e[tag=vexp.current_pickup,tag=vexp.stone,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.stone
execute if entity @e[tag=vexp.current_pickup,tag=vexp.bone,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.bone
execute if entity @e[tag=vexp.current_pickup,tag=vexp.gold,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.gold
execute if entity @e[tag=vexp.current_pickup,tag=vexp.diamond,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.diamond
execute if entity @e[tag=vexp.current_pickup,tag=vexp.copper,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.copper
execute if entity @e[tag=vexp.current_pickup,tag=vexp.netherite,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.netherite
execute if entity @e[tag=vexp.current_pickup,tag=vexp.echo,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.echo
execute if entity @e[tag=vexp.current_pickup,tag=vexp.glowing,limit=1] run tag @p[tag=vexp.picker,limit=1] add vexp.glowing

# Transferir data de la dagger
execute as @e[tag=vexp.current_pickup,limit=1] if data entity @s data.dagger_data run data modify storage vexp:dungeons.weapon dagger_data set from entity @s data.dagger_data
execute as @e[tag=vexp.current_pickup,limit=1] unless data entity @s data.dagger_data run data modify storage vexp:dungeons.weapon dagger_data set value {}

# Pasar el daño acumulado al picker
execute as @e[tag=vexp.current_pickup,limit=1] run scoreboard players operation @p[tag=vexp.picker,limit=1] vexp.damage = @s vexp.damage
tag @p[tag=vexp.picker,limit=1] add vexp.restore_dagger_damage

# Pasar encantamientos del marker stuck al flujo de devolución
execute as @e[tag=vexp.current_pickup,limit=1] if data entity @s data.enchantments run data modify storage vexp:dungeons.weapon return.enchantments set from entity @s data.enchantments
execute as @e[tag=vexp.current_pickup,limit=1] unless data entity @s data.enchantments run data modify storage vexp:dungeons.weapon return.enchantments set value {}
tag @p[tag=vexp.picker,limit=1] add vexp.restore_dagger_enchantments

# Dar el item (usará los tags que acabamos de ponerle al picker)
execute as @p[tag=vexp.picker,limit=1] run function vexp:dungeons/weapons/dagger/give

# 3. Sonido
playsound minecraft:entity.item.pickup player @a ~ ~ ~ 1 1

# 4. Limpiar entidades exactas de este ID
execute as @e[tag=vexp.dagger_stuck,sort=nearest,limit=1] if score @s vexp.id = #temp vexp.id run kill @s
execute as @e[tag=vexp.dagger_stuck_visual,sort=nearest,limit=1] if score @s vexp.id = #temp vexp.id run kill @s
execute as @e[tag=vexp.dagger_stuck_interact,sort=nearest,limit=1] if score @s vexp.id = #temp vexp.id run kill @s

# Limpiar tags temporales
tag @e[tag=vexp.current_pickup] remove vexp.current_pickup
tag @e[tag=vexp.picker] remove vexp.picker
