# dungeons/scythe/netherite/on_right_click.mcfunction
# @s is the player

# Projectile summon (nether_proj)
summon marker ~ ~1.6 ~ {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_projectile"],data:{proj_type:"nether"}}
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s data.proj set value {speed:1.2, lifetime:40, gravity:0, damage:4}
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Sound
playsound minecraft:item.firecharge.use player @a ~ ~ ~ 1 1
