# Assign 'vexp.hitted' to the nearest valid entity in range
# Para no dejar puntos ciegos si el enemigo está muy pegado (Ej: daga de reach=2 pero range=0.8 dejaría ciego el punto 0.5):
# Nos posicionamos a 1.2 bloques y evaluamos con un rango dinámico que abarque al enemigo más cercano dentro del $(reach).
$execute anchored eyes positioned ^ ^ ^1.2 as @e[predicate=vexp:is_target,tag=!vexp.attacker,distance=..$(reach),sort=nearest] at @s run tag @s add vexp.hitted

# Apply damage to the hitted entity
$execute as @e[tag=vexp.hitted] run damage @s $(damage) minecraft:player_attack by @p
