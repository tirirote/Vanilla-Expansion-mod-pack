# projectile/move.mcfunction
# Movimiento del proyectil combinando velocidad y gravedad
# @s es el proyectil
# Macro que recibe proj.speed y proj.gravity desde el NBT del proyectil

# Convertimos gravity a scoreboard (x100) para poder comparar si es > 1.0
execute store result score #proj_gravity vexp.math run data get entity @s data.proj.gravity 100

# Si gravity > 1.0, aplicar movimiento con caída
$execute if score #proj_gravity vexp.math matches 101.. run tp @s ^ ^ ^$(speed) ~ ~$(gravity)

# Si gravity <= 1.0, no aplicar caída
$execute unless score #proj_gravity vexp.math matches 101.. run tp @s ^ ^ ^$(speed)
