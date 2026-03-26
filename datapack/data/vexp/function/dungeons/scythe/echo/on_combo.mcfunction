# dungeons/scythe/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/echo_marked
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Knockback {strength:-4.0, y:0.1}
function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.25}

data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.echo_projectile",proj_type:"echo_scythe",proj_data:{}}
function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

execute as @e[tag=vexp.temp_projectile,limit=1] at @s run function vexp:projectile/spawn
