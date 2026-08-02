#Tag al jugador como propietario del proyectil
tag @s add vexp.projectile_owner

# 3 Projectile summon (handgun bullet)
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.handgun_bullet",proj_type:"handgun_bullet",proj_data:{}}
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

execute as @e[type=minecraft:item_display,tag=vexp.temp_projectile,tag=vexp.handgun_bullet,distance=..3] at @s rotated as @p[tag=vexp.projectile_owner,limit=1] run function vexp:projectile/spawn
