# Apply a small random local offset so the projectile path feels erratic
function vexp:utils/get_random_128

$execute if score #random vexp.id matches ..-97 run tp @s ^-$(strength) ^ ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches -96..-65 run tp @s ^$(strength) ^ ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches -64..-33 run tp @s ^ ^$(strength) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches -32..-1 run tp @s ^ ^-$(strength) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 0..31 run tp @s ^-$(strength) ^$(strength) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 32..63 run tp @s ^$(strength) ^$(strength) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 64..95 run tp @s ^-$(strength) ^-$(strength) ^$(speed) ~ ~$(gravity)
$execute if score #random vexp.id matches 96.. run tp @s ^$(strength) ^-$(strength) ^$(speed) ~ ~$(gravity)
