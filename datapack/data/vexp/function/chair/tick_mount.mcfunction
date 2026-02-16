# Lógica por Montura (Armor Stand)
# Se ejecuta AS @s (la montura)

# Si la montura no es temporal e interna (recién creada) Y no tiene Passengers -> Matarla
execute if entity @s[tag=!vexp.temp] unless data entity @s Passengers run kill @s
