# dungeons/states/amethyst_fragmentation.mcfunction
# @s is the target mob

# Visual and Sound
particle minecraft:block{block_state:{Name:"minecraft:amethyst_cluster"}} ~ ~1 ~ 0.5 0.5 0.5 0.1 20
playsound minecraft:block.amethyst_cluster.break ambient @a ~ ~ ~ 1 1.5

# Summon 3 fragments in a circle
# Using a marker with data and calling projectile/spawn
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.amethyst_fragment",proj_type:"amethyst_fragment",proj_data:{}}

# Fragment 1
execute positioned ~ ~1 ~ run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s data.proj set value {speed:0.8, lifetime:20, gravity:0, damage:2, randomness:0, homing_distance:0.0}
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s Rotation set value [0f, 0f]
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Fragment 2
execute positioned ~ ~1 ~ run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s data.proj set value {speed:0.8, lifetime:20, gravity:0, damage:2, randomness:0, homing_distance:0.0}
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s Rotation set value [120f, 0f]
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Fragment 3
execute positioned ~ ~1 ~ run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s data.proj set value {speed:0.8, lifetime:20, gravity:0, damage:2, randomness:0, homing_distance:0.0}
execute as @e[tag=vexp.temp_projectile,limit=1] run data modify entity @s Rotation set value [240f, 0f]
execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn
