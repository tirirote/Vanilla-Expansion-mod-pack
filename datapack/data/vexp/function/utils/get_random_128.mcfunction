# get_random_128.mcfunction
# Genera un número aleatorio entre -128 y 128
# El resultado se guarda en el scoreboard #random vexp.id

execute store result score #random vexp.id run random value -128..128
