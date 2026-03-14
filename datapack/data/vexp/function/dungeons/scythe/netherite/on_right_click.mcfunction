# dungeons/scythe/netherite/on_right_click.mcfunction
# @s is the player

tag @s add vexp.projectile_owner

# 3 Projectile summon (nether_proj)
summon marker ^ ^ ^1 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_projectile"],data:{proj_type:"nether_scythe"}}
summon marker ^-1 ^ ^.6 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_projectile"],data:{proj_type:"nether_scythe"}}
summon marker ^1 ^ ^.6 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_projectile"],data:{proj_type:"nether_scythe"}}

execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.nether_projectile,distance=..3] at @s facing entity @p[tag=vexp.projectile_owner] eyes run function vexp:projectile/spawn

# Sound
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
