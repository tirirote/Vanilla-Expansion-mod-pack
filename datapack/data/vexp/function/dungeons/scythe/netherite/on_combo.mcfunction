# dungeons/scythe/netherite/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/nether_marked

data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.nether_projectile",proj_type:"nether_scythe",proj_data:{}}
function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Knockback {strength:-4.0, y:0.1}
execute positioned ~ ~1 ~ run function vexp:utils/hits/fire_hit

function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.1}
