# dungeons/scythe/echo/on_right_click.mcfunction
# @s is the player

# 3 Projectile summon (echo_proj)
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.echo_projectile",proj_type:"echo_scythe",proj_data:{}}

tag @s add vexp.projectile_owner
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.echo_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Sound
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_summon", type: "player"}
