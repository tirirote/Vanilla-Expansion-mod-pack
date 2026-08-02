# Scythe on right click
# @s is the player

tag @s add vexp.projectile_owner

# Spawn projectile marker in front of player, preserving look direction.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.scythe_projectile",proj_type:"bone_scythe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Inicializar proyectil
execute as @e[type=minecraft:item_display,tag=vexp.scythe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Feedback
function vexp:dungeons/fx/right_click/bone
particle sweep_attack ^ ^ ^2.5 0 0 0 0 0
