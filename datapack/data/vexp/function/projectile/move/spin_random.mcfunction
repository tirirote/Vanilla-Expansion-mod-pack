# projectile/move/spin_random.mcfunction
# Aplicar spin aleatorio por tick para proyectiles sin face_player y con randomness.
# El valor de spin sigue determinando la magnitud base del giro, pero su aplicación varía.
# Llamado con 'with entity @s data.proj' → $(spin) disponible.

execute store result score @s vexp.rand run random value -250..250

# Algunos ticks no giran, otros giran una vez y otros giran dos veces.
$execute if score @s vexp.rand matches 1.. run tp @s ~ ~ ~ ~-$(spin) ~
$execute if score @s vexp.rand matches ..0 run tp @s ~ ~ ~ ~$(spin) ~
