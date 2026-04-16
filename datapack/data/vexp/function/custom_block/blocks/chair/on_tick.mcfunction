# Liberar estado ocupado si no existe montura activa asociada cerca.
execute if entity @s[tag=vexp.occupied] unless entity @e[type=armor_stand,tag=vexp.chair_mount,distance=..0.5] run tag @s remove vexp.occupied
