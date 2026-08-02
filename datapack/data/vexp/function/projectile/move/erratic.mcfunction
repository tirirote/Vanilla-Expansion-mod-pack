# projectile/move/erratic.mcfunction
# Vuelo errático: jitter aleatorio lateral + avance + gravedad en un solo tp por tick.
# Spin se aplica en move/spin.mcfunction (paso independiente — no se incluye aquí).
# Llamado con 'with entity @s data.proj' → $(randomness), $(speed), $(gravity) disponibles.

execute store result score @s vexp.rand run random value -250..250

$execute if score @s vexp.rand matches ..-200 run tp @s ^$(randomness) ^ ^$(speed) ~-$(spin) ~$(gravity)
$execute if score @s vexp.rand matches -199..-150 run tp @s ^-$(randomness) ^ ^$(speed) ~ ~$(gravity)
$execute if score @s vexp.rand matches -149..-100 run tp @s ^ ^$(randomness) ^$(speed) ~$(spin) ~$(gravity)
$execute if score @s vexp.rand matches -99..-50 run tp @s ^ ^-$(randomness) ^$(speed) ~ ~$(gravity)
$execute if score @s vexp.rand matches -49..0 run tp @s ^ ^ ^$(speed) ~-$(spin) ~$(gravity)

$execute if score @s vexp.rand matches 1..49 run tp @s ^$(randomness) ^ ^$(speed) ~$(spin) ~-$(gravity)
$execute if score @s vexp.rand matches 50..99 run tp @s ^-$(randomness) ^ ^$(speed) ~ ~-$(gravity)
$execute if score @s vexp.rand matches 100..149 run tp @s ^ ^$(randomness) ^$(speed) ~$(spin) ~-$(gravity)
$execute if score @s vexp.rand matches 150..199 run tp @s ^ ^-$(randomness) ^$(speed) ~ ~-$(gravity)
$execute if score @s vexp.rand matches 200.. run tp @s ^ ^ ^$(speed) ~$(spin) ~-$(gravity)
