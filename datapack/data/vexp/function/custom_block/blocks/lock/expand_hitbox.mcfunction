# Ancho 3 cubre el bloque objetivo en cualquier lado (la hitbox es cuadrada y centrada).
execute if data entity @s data.vexp{target_type:"container"} run data modify entity @s width set value 1.1f
execute if data entity @s data.vexp{target_type:"container"} run data modify entity @s height set value 1.1f
execute if data entity @s data.vexp{target_type:"container"} at @s run tp @s ^ ^-0.45 ^0.55

execute if data entity @s data.vexp{target_type:"door"} run data modify entity @s width set value 1.1f
execute if data entity @s data.vexp{target_type:"door"} run data modify entity @s height set value 2.0f
execute if data entity @s data.vexp{target_type:"door"} at @s run tp @s ^ ^-0.5 ^0.25

tag @s add vexp.lock_expanded
