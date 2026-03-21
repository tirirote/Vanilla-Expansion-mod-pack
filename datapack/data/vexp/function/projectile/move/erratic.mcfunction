# projectile/move/erratic.mcfunction
# Vuelo errático: jitter aleatorio lateral + avance + gravedad en un solo tp por tick.
# Spin se aplica en move/spin.mcfunction (paso independiente — no se incluye aquí).
# Llamado con 'with entity @s data.proj' → $(randomness), $(speed), $(gravity) disponibles.

function vexp:utils/get_random_128

$execute if score #random vexp.id matches ..-97 run tp @s ^-$(randomness) ^ ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches -96..-65 run tp @s ^$(randomness) ^ ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches -64..-33 run tp @s ^ ^$(randomness) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches -32..-1 run tp @s ^ ^-$(randomness) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 0..31 run tp @s ^-$(randomness) ^$(randomness) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 32..63 run tp @s ^$(randomness) ^$(randomness) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 64..95 run tp @s ^-$(randomness) ^-$(randomness) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 96.. run tp @s ^$(randomness) ^-$(randomness) ^$(speed) ~ ~$(gravity)
