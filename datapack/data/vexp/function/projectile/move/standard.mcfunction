# projectile/move/standard.mcfunction
# Vuelo estándar: avanzar en la dirección de mirada y ajustar pitch por gravedad.
# Llamado con 'with entity @s data.proj' → $(speed), $(gravity) disponibles.
# Spin se aplica en move/spin.mcfunction (paso independiente).

$tp @s ^ ^ ^$(speed) ~ ~$(gravity)
