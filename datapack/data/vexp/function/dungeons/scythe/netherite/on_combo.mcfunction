# dungeons/scythe/netherite/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/nether_marked

summon marker ~ ~ ~ {Tags:["vexp.projectile","vexp.temp_projectile","vexp.nether_projectile"],data:{proj_type:"nether_scythe"}}

execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn

# Knockback {strength:-4.0, y:0.1}
function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.1}
