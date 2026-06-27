# Echo projectile hook on entity hit

#Teleport player behind mob
execute as @e[predicate=vexp:is_target,tag=vexp.echo_marked,distance=..24,sort=nearest,limit=1] if data entity @s HurtTime at @s positioned ~ ~.05 ~ if block ^ ^ ^-1 #replaceable run tp @p[tag=vexp.projectile_owner,limit=1] ^ ^ ^-1 facing entity @s

execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

function vexp:dungeons/fx/hits/echo_hit
