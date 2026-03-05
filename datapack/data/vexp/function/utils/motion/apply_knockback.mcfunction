#Kockback with TP
# $(strength): fuerza (positivo = empuje, negativo = atracción)
$execute at @s facing entity @p[tag=vexp.attacker,limit=1] feet anchored feet run tp @s ^ ^$(y) ^$(strength)