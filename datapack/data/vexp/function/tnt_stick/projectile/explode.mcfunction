# Explode Logic
# Ejecutado AS @s (marker) AT @s

tag @s add vexp.exploding

# Sonido de explosión
playsound minecraft:entity.generic.explode ambient @a ~ ~ ~ 1 1

# Partículas
particle minecraft:explosion ~ ~ ~ 0 0 0 1 1
particle minecraft:large_smoke ~ ~ ~ .1 .1 .1 .1 10
particle minecraft:lava ~ ~ ~ .1 .1 .1 .1 3

# Invocamos una explosión real
function vexp:tnt_stick/projectile/explosion_damage

# Eliminar visual e indicador con ID coincidente
execute as @e[tag=vexp.tnt_display] if score @s vexp.id = @e[tag=vexp.exploding,limit=1,distance=..1] vexp.id run kill @s

kill @s
