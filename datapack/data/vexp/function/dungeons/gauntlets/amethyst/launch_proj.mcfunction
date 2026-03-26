# dungeons/gauntlets/amethyst/launch_proj.mcfunction
# Launch a projectile that marks target for telekinesis

data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.amethyst_marker_projectile",proj_type:"amethyst_marker",proj_data:{}}
execute positioned ~ ~1.6 ~ run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s data.proj set value {speed:1.5, lifetime:40, gravity:0, damage:0, randomness:0.15, homing_distance:5.0}
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Feedback
playsound minecraft:block.amethyst_block.hit ambient @a ~ ~ ~ 1 2
