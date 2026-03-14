# dungeons/gauntlets/amethyst/launch_proj.mcfunction
# Launch a projectile that marks target for telekinesis

summon marker ~ ~1.6 ~ {Tags:["vexp.projectile","vexp.temp_projectile","vexp.amethyst_marker_projectile"],data:{proj_type:"amethyst_marker"}}
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s data.proj set value {speed:1.5, lifetime:40, gravity:0, damage:0, randomness:0.15, homing_distance:5.0}
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Feedback
playsound minecraft:block.amethyst_block.hit ambient @a ~ ~ ~ 1 2
