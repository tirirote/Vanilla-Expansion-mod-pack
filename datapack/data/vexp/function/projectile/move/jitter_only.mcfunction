# projectile/move/jitter_only.mcfunction
# Jitter aleatorio sin avance para combinar randomness con modo orbital.
# Llamado con 'with entity @s data.proj' -> $(randomness) disponible.

function vexp:utils/get_random_128

$execute if score #random vexp.id matches ..-97 run tp @s ^-$(randomness) ^ ^
$execute if score #random vexp.id matches -96..-65 run tp @s ^$(randomness) ^ ^
$execute if score #random vexp.id matches -64..-33 run tp @s ^ ^$(randomness) ^
$execute if score #random vexp.id matches -32..-1 run tp @s ^ ^-$(randomness) ^
$execute if score #random vexp.id matches 0..31 run tp @s ^-$(randomness) ^$(randomness) ^
$execute if score #random vexp.id matches 32..63 run tp @s ^$(randomness) ^$(randomness) ^
$execute if score #random vexp.id matches 64..95 run tp @s ^-$(randomness) ^-$(randomness) ^
$execute if score #random vexp.id matches 96.. run tp @s ^$(randomness) ^-$(randomness) ^
