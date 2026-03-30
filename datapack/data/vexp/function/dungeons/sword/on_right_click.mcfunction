# dungeons/sword/on_right_click.mcfunction
# @s is the player
tag @s add vexp.projectile_owner

# 3 Projectile summon (common_sword)
execute positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand {projectile_tag:"vexp.common_sword",proj_type:"common_sword",proj_data:{}}
execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.common_sword,distance=..3] at @s rotated as @p[tag=vexp.projectile_owner,limit=1] run function vexp:projectile/spawn

function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
