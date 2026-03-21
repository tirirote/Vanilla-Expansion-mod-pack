# dungeons/sword/echo/on_right_click.mcfunction
# @s is the player

# Optional startup wave
execute positioned ~ ~-1.5 ~ run function vexp:dungeons/sword/echo/wave

tag @s add vexp.projectile_owner

# Orient spawned projectiles outward from the player-centered circle
execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.echo_sword_projectile,distance=..4] at @s run tag @s add vexp.keep_rotation
execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.echo_sword_projectile,distance=..4] at @s facing entity @p[tag=vexp.projectile_owner,distance=..5,limit=1,sort=nearest] eyes run tp @s ~ ~ ~ ~180 ~10

# Initialize the newly spawned volley.
execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.echo_sword_projectile,distance=..4] at @s run function vexp:projectile/spawn

