# dungeons/scythe/on_right_click.mcfunction
# @s is the player

# Spawn projectile marker in front of player, preserving look direction.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.scythe_projectile",proj_type:"diamond_scythe",proj_data:{}}

tag @s add vexp.projectile_owner
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:armor_stand,tag=vexp.scythe_projectile,tag=vexp.temp_projectile,sort=nearest,limit=1,distance=..4] at @s run function vexp:projectile/spawn

# Feedback
function vexp:dungeons/fx/right_click/diamond
particle sweep_attack ^ ^ ^2.5 0 0 0 0 0
