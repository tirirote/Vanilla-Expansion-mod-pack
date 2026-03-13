#Projectile
summon marker ~ ~1 ~ {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_projectile"],data:{proj_type:"nether_sword"}}
execute as @e[tag=vexp.temp_projectile,sort=nearest,limit=1] run data modify entity @s data.proj set value {speed:1.5, lifetime:20, gravity:0, damage:2}

tag @p[tag=vexp.attacker,limit=1] add vexp.projectile_owner

execute as @e[tag=vexp.temp_projectile,sort=nearest,limit=1] at @s run function vexp:projectile/spawn

#Knockback {-2.5, 0.1}
function vexp:utils/motion/apply_knockback {strength:-2.5,y:0.1}
particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1
particle minecraft:large_smoke ~ ~1 ~ 0.25 0.25 0.25 0.1 3
