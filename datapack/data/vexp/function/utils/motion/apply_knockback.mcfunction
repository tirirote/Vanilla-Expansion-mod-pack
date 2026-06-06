#Kockback with TP
# $(strength): fuerza (positivo = empuje, negativo = atracción)
$execute at @s[tag=!vexp.custom_block.dummy_mob,type=!item_display,type=!item,type=!marker,type=!interaction] if block ^ ^ ^$(strength) #replaceable if entity @p[tag=vexp.attacker,distance=..12,limit=1] facing entity @p[tag=vexp.attacker,limit=1] feet anchored feet run tp @s ^ ^$(y) ^$(strength)
$execute at @s[tag=!vexp.custom_block.dummy_mob,type=!item_display,type=!item,type=!marker,type=!interaction] if block ^ ^ ^$(strength) #replaceable unless entity @p[tag=vexp.attacker,distance=..12,limit=1] facing entity @p[limit=1] feet anchored feet run tp @s ^ ^$(y) ^$(strength)
