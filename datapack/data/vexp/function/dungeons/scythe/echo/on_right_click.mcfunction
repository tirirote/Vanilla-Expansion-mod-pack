# dungeons/scythe/echo/on_right_click.mcfunction
# @s is the player

tag @s add vexp.projectile_owner

# 3 Projectile summon (echo_proj)
summon marker ^ ^ ^1 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.echo_projectile"],data:{proj_type:"echo_scythe"}}
summon marker ^-1 ^ ^.3 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.echo_projectile"],data:{proj_type:"echo_scythe"}}
summon marker ^1 ^ ^.3 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.echo_projectile"],data:{proj_type:"echo_scythe"}}

execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.echo_projectile,distance=..3] at @s rotated as @p[tag=vexp.projectile_owner,limit=1] run function vexp:projectile/spawn

# Sound
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.evoker.prepare_attack", type: "player"}
