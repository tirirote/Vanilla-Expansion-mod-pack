# projectile/move/spin.mcfunction
# Aplicar rotación adicional de yaw al proyectil.
# Llamado con 'with entity @s data.proj' → $(spin) disponible.
# Spin positivo = giro horario; negativo = giro antihorario.

$tp @s ~ ~ ~ ~$(spin) ~$(gravity)
