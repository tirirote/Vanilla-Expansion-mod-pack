#Kockback with TP
# $(strength): fuerza (positivo = empuje, negativo = atracción)
$execute at @s if entity @p[tag=vexp.attacker,distance=10,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet anchored feet run tp @s ^ ^$(y) ^$(strength)
$execute at @s unless entity @p[tag=vexp.attacker,distance=10,limit=1] facing entity @p[limit=1] feet anchored feet run tp @s ^ ^$(y) ^$(strength)