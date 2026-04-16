# Ejecutado como el MOB que se va a sentar.

# Limpiar target de montura temporal previo.
tag @e[type=armor_stand,tag=vexp.mount_target] remove vexp.mount_target

# Marcar la silla original (por ID) como ocupada.
execute as @e[type=interaction,tag=vexp.chair_interact] if score @s vexp.id = #chair_mount_id vexp.id run tag @s add vexp.occupied

# Invocar montura en la silla marcada.
execute as @e[type=interaction,tag=vexp.chair_interact] if score @s vexp.id = #chair_mount_id vexp.id at @s run summon armor_stand ~ ~0.5 ~ {Tags:["vexp.chair_mount","vexp.temp"],Invisible:1b,Marker:1b,NoGravity:1b,Small:1b}

# Asignar el mismo ID de silla a la montura recien creada y marcarla como objetivo.
execute as @e[type=interaction,tag=vexp.chair_interact] if score @s vexp.id = #chair_mount_id vexp.id at @s as @e[type=armor_stand,tag=vexp.chair_mount,tag=vexp.temp,sort=nearest,distance=..1,limit=1] run scoreboard players operation @s vexp.id = #chair_mount_id vexp.id
execute as @e[type=armor_stand,tag=vexp.chair_mount,tag=vexp.temp,distance=..5] if score @s vexp.id = #chair_mount_id vexp.id run tag @s add vexp.mount_target

# Sincronizar rotacion con la silla visual.
execute as @e[type=interaction,tag=vexp.chair_interact] if score @s vexp.id = #chair_mount_id vexp.id at @s as @e[type=armor_stand,tag=vexp.mount_target,sort=nearest,distance=..1,limit=1] run data modify entity @s Rotation set from entity @e[type=item_display,tag=vexp.chair,sort=nearest,distance=..1,limit=1] Rotation

# Sentar al mob.
ride @s mount @e[type=armor_stand,tag=vexp.mount_target,sort=nearest,distance=..5,limit=1]

# Marcar al mob como sentado y soltar correa.
tag @s add vexp.is_sitting_mob

# Limpieza local.
tag @e[type=armor_stand,tag=vexp.mount_target,distance=..5,limit=1] remove vexp.mount_target
