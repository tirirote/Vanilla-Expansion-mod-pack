# projectile/move/face_player.mcfunction
# Copiar la rotación del dueño al proyectil cada tick.
# Búsqueda por vexp.id — tag vexp.projectile_owner se elimina en spawn.
# @s = proyectil. Con macro (usa $(height) y $(radius)).

scoreboard players operation #face_owner_id vexp.math = @s vexp.id
tag @s add vexp.face_projectile_temp
# Resolver dueño por ID y copiar su rotación exacta al proyectil ejecutor
execute as @a if score @s vexp.id = #face_owner_id vexp.math run tag @s add vexp.face_owner_temp
$execute as @a[tag=vexp.face_owner_temp,limit=1] at @s positioned ~ ~$(height) ~ at @e[tag=vexp.face_projectile_temp,limit=1] rotated as @s run tp @e[tag=vexp.face_projectile_temp,limit=1] ^ ^ ^$(radius) ~ ~
tag @s remove vexp.face_projectile_temp
tag @a[tag=vexp.face_owner_temp] remove vexp.face_owner_temp
