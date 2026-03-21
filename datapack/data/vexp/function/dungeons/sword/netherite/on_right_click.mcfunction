# dungeons/sword/netherite/on_right_click.mcfunction
# @s is the player

# Spawn two tornado markers orbiting the player
tag @s add vexp.projectile_owner

# 3 Projectile summon (nether_sword)
summon marker ^ ^ ^1 {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_sword"],data:{proj_type:"nether_sword"}}
execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.nether_sword,distance=..3] at @s rotated as @p[tag=vexp.projectile_owner,limit=1] run function vexp:projectile/spawn

particle minecraft:large_smoke ~ ~ ~ 0.2 0.2 0.2 0.1 3
particle minecraft:flame ~ ~ ~ 0.25 0.25 0.25 0.03 3

function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
