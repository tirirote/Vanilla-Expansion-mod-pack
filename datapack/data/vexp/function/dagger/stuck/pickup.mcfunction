# 1. Identificar al jugador y guardar ID
execute on target run tag @s add vexp.picker
execute on attacker run tag @s add vexp.picker
scoreboard players operation #temp vexp.id = @s vexp.id

# 2. Pasar material del marcador al jugador para el 'give'
execute as @e[tag=vexp.dagger_stuck,tag=vexp.iron,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.iron
execute as @e[tag=vexp.dagger_stuck,tag=vexp.wood,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.wood
execute as @e[tag=vexp.dagger_stuck,tag=vexp.stone,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.stone
execute as @e[tag=vexp.dagger_stuck,tag=vexp.gold,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.gold
execute as @e[tag=vexp.dagger_stuck,tag=vexp.diamond,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.diamond
execute as @e[tag=vexp.dagger_stuck,tag=vexp.copper,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.copper
execute as @e[tag=vexp.dagger_stuck,tag=vexp.netherite,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run tag @p[tag=vexp.picker,limit=1] add vexp.netherite

# Pasar el daño acumulado al picker
execute as @e[tag=vexp.dagger_stuck,distance=..2,limit=1] if score @s vexp.id = #temp vexp.id run scoreboard players operation @p[tag=vexp.picker,limit=1] vexp.damage = @s vexp.damage

# Dar el item (Usará los tags que acabamos de ponerle al picker)
execute as @p[tag=vexp.picker,limit=1] run function vexp:dagger/give

# 3. Sonido
playsound minecraft:entity.item.pickup player @a ~ ~ ~ 1 1

# 4. Limpiar entidades (Marker al que estamos pegados y Visual)
execute as @e[tag=vexp.dagger_stuck] if score @s vexp.id = #temp vexp.id run kill @s
execute as @e[tag=vexp.dagger_stuck_visual] if score @s vexp.id = #temp vexp.id run kill @s

# Por seguridad matamos el marcador de interacción (que es @s)
kill @s

# Limpiar tag del jugador
tag @e[tag=vexp.picker] remove vexp.picker
