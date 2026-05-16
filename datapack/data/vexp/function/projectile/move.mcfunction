# projectile/move.mcfunction
# Dispatcher de movimiento: lee parámetros a scoreboards y delega en sub-funciones.
# Cada comportamiento opcional está en projectile/move/<nombre>.mcfunction
# NO es función macro — los sub-ficheros usan 'with entity @s data.proj' cuando lo necesitan.

# -- Leer todos los parámetros a scoreboards --
execute store result score #proj_speed vexp.math run data get entity @s data.proj.speed 100
execute store result score #proj_gravity vexp.math run data get entity @s data.proj.gravity 100
execute store result score #proj_randomness vexp.math run data get entity @s data.proj.randomness 100
execute store result score #proj_homing vexp.math run data get entity @s data.proj.homing_distance 100
execute store result score #proj_spin vexp.math run data get entity @s data.proj.spin 100
execute store result score #proj_face vexp.math run data get entity @s data.proj.face_player
execute store result score #proj_radius vexp.math run data get entity @s data.proj.radius 100

# Paso 1 — face_player: orientar al proyectil como el dueño (antes de mover)
execute if score #proj_face vexp.math matches 1.. unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 run function vexp:projectile/move/face_player with entity @s data.proj

# Paso 2 — spin condicional
#   - sin face_player + órbita: spin progresivo estable
#   - sin face_player + randomness: spin aleatorio por tick
#   - sin face_player + vuelo libre: spin determinista estándar
execute unless score #proj_face vexp.math matches 1.. if score #proj_radius vexp.math matches 1.. if score #proj_spin vexp.math matches 1.. run function vexp:projectile/move/spin with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. if score #proj_radius vexp.math matches 1.. if score #proj_spin vexp.math matches ..-1 run function vexp:projectile/move/spin with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. if score #proj_radius vexp.math matches ..-1 if score #proj_spin vexp.math matches 1.. run function vexp:projectile/move/spin with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. if score #proj_radius vexp.math matches ..-1 if score #proj_spin vexp.math matches ..-1 run function vexp:projectile/move/spin with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 if score #proj_randomness vexp.math matches 1.. if score #proj_spin vexp.math matches 1.. run function vexp:projectile/move/spin_random with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 if score #proj_randomness vexp.math matches 1.. if score #proj_spin vexp.math matches ..-1 run function vexp:projectile/move/spin_random with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 unless score #proj_randomness vexp.math matches 1.. if score #proj_spin vexp.math matches 1.. run function vexp:projectile/move/spin with entity @s data.proj
execute unless score #proj_face vexp.math matches 1.. unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 unless score #proj_randomness vexp.math matches 1.. if score #proj_spin vexp.math matches ..-1 run function vexp:projectile/move/spin with entity @s data.proj

# Paso 3 — movimiento posicional (órbita y vuelo son mutuamente excluyentes):
# 3a. Órbita activa: expandir radio en NBT y reposicionar en torno al dueño
execute if score #proj_radius vexp.math matches 1.. run scoreboard players operation #proj_radius vexp.math += #proj_speed vexp.math
execute if score #proj_radius vexp.math matches 1.. store result entity @s data.proj.radius float 0.01 run scoreboard players get #proj_radius vexp.math
execute if score #proj_radius vexp.math matches 1.. unless score #proj_randomness vexp.math matches 1.. run function vexp:projectile/move/orbit with entity @s data.proj
execute if score #proj_radius vexp.math matches ..-1 unless score #proj_randomness vexp.math matches 1.. run function vexp:projectile/move/orbit with entity @s data.proj
execute if score #proj_radius vexp.math matches 1.. if score #proj_randomness vexp.math matches 1.. run function vexp:projectile/move/orbit_random with entity @s data.proj
execute if score #proj_radius vexp.math matches ..-1 if score #proj_randomness vexp.math matches 1.. run function vexp:projectile/move/orbit_random with entity @s data.proj

# 3b. Vuelo libre estándar (sin jitter)
execute unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 unless score #proj_randomness vexp.math matches 1.. run function vexp:projectile/move/standard with entity @s data.proj

# 3c. Vuelo errático (con jitter aleatorio por tick)
execute unless score #proj_radius vexp.math matches 1.. unless score #proj_radius vexp.math matches ..-1 if score #proj_randomness vexp.math matches 1.. run function vexp:projectile/move/erratic with entity @s data.proj

# Paso 4 — homing: orientar hacia el objetivo válido más cercano (post-movimiento)
# Dispatcher automático que usa exclusión si está configurada
execute if score #proj_homing vexp.math matches 1.. run function vexp:projectile/move/homing_dispatch
