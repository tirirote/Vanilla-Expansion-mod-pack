# Spawn thunder projectile on the current target.
# @s is the target entity selected by thundering AoE.
tag @s add vexp.projectile_owner

data modify storage vexp:temp projectile_spawn set value {projectile_tag:"enchantment_thunder",proj_type:"enchantment_thunder",proj_data:{}}
execute positioned ~ ~1.5 ~ positioned ^ ^ ^.5 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

execute as @e[type=minecraft:item_display,tag=enchantment_thunder,tag=vexp.temp_projectile,sort=nearest,limit=1,distance=..2] at @s run function vexp:projectile/spawn
