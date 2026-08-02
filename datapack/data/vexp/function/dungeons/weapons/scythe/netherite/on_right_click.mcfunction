# Scythe on right click
# @s is the player

# 3 Projectile summon (nether_proj)
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.nether_projectile",proj_type:"nether_scythe",proj_data:{}}

#First proj
tag @s add vexp.projectile_owner
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:item_display,tag=vexp.temp_projectile,tag=vexp.nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Feedback
function vexp:dungeons/fx/right_click/netherite
particle sweep_attack ^ ^ ^2.5 0 0 0 0 0
