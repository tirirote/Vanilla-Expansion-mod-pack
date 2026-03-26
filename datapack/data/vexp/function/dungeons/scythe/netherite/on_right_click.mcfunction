# dungeons/scythe/netherite/on_right_click.mcfunction
# @s is the player

tag @s add vexp.projectile_owner

# 3 Projectile summon (nether_proj)
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.nether_projectile",proj_type:"nether_scythe",proj_data:{}}
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute positioned ^-1 ^ ^.6 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute positioned ^1 ^ ^.6 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.nether_projectile,distance=..3] at @s rotated as @p[tag=vexp.projectile_owner,limit=1] run function vexp:projectile/spawn

# Sound
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
