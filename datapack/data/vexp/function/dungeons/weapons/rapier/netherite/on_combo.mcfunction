# dungeons/rapier/netherite/on_combo.mcfunction
# @s is the target entity

#Mark the mob
function vexp:dungeons/states/nether_marked

# Strong push away for the mob
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.35}

#Special Rapier proj
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.nether_projectile",proj_type:"nether_rapier",proj_data:{}}

tag @p[tag=vexp.attacker,limit=1] add vexp.projectile_owner
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.nether_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

#Player pushback
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/rapier/player_pushback

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/netherite_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
