# Función para manejar cuando el arma está vacía
# 1. Sonido de clic (arma vacía)
playsound minecraft:item.flintandsteel.use player @s ~ ~ ~ 1 1
playsound minecraft:entity.generic.burn player @s ~ ~ ~ 1 1

# 2. Partículas de chispa
particle smoke ~ ~ ~ 0 0 0 0.01 1 force
particle crit ~ ~ ~ 0 0 0 0.01 1 force