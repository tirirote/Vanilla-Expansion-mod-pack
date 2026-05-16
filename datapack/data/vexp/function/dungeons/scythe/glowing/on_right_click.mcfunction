# dungeons/scythe/glowing/on_right_click.mcfunction
# @s is the player

# Summon projectile
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.scythe_projectile",proj_type:"glowing_scythe",proj_data:{}}

tag @s add vexp.projectile_owner
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.scythe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}

