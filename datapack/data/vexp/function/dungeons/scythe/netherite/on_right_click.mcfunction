# dungeons/scythe/netherite/on_right_click.mcfunction
# @s is the player

# 3 Projectile summon (nether_proj)
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.nether_projectile",proj_type:"nether_scythe",proj_data:{}}

#First proj
tag @s add vexp.projectile_owner
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

#tag @s add vexp.projectile_owner
#execute positioned ^-1 ^ ^.6 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
#execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

#tag @s add vexp.projectile_owner
#execute positioned ^1 ^ ^.6 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
#execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Sound
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
