# dungeons/amethyst_fragment/projectile/on_hit_mob.mcfunction
# @s is the fragment, @e[tag=vexp.proj_target] is the mob

# Effects
execute as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:levitation 1 1 true
execute as @e[tag=vexp.proj_target,limit=1] run effect give @s minecraft:slowness 1 1 true
execute as @e[tag=vexp.proj_target,limit=1] run tag @s add vexp.hitted

# Visual
particle minecraft:block{block_state:{Name:"minecraft:amethyst_cluster"}} ~ ~ ~ 0.5 0.5 0.5 0.1 10
 playsound minecraft:block.amethyst_cluster.break ambient @a ~ ~ ~ 1 1.5
