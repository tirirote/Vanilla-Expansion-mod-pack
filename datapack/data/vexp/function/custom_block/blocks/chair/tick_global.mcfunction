# Mantenimiento global de sillas integradas en custom_block.

# Desmontado de jugadores que perdieron RootVehicle.
execute as @a[tag=vexp.is_sitting,tag=!vexp.sit_grace] at @s unless data entity @s RootVehicle run function vexp:custom_block/blocks/chair/dismount

# Consumir la gracia de montaje para evitar desmontaje instantaneo.
tag @a[tag=vexp.sit_grace] remove vexp.sit_grace

# Limpieza de monturas huerfanas.
execute as @e[type=armor_stand,tag=vexp.chair_mount] at @s run function vexp:custom_block/blocks/chair/tick_mount
