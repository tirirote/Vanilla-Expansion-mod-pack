# projectile/move/spin_random.mcfunction
# Aplicar spin aleatorio por tick para proyectiles sin face_player y con randomness.
# El valor de spin sigue determinando la magnitud base del giro, pero su aplicación varía.
# Llamado con 'with entity @s data.proj' → $(spin) disponible.

function vexp:utils/get_random_128

# Algunos ticks no giran, otros giran una vez y otros giran dos veces.
$execute if score #random vexp.id matches ..-65 run tp @s ~ ~ ~ ~$(spin) ~$(gravity)
$execute if score #random vexp.id matches 48..95 run tp @s ~ ~ ~ ~$(spin) ~$(gravity)
$execute if score #random vexp.id matches 96.. run tp @s ~ ~ ~ ~$(spin) ~$(gravity)
$execute if score #random vexp.id matches 96.. run tp @s ~ ~ ~ ~$(spin) ~$(gravity)
