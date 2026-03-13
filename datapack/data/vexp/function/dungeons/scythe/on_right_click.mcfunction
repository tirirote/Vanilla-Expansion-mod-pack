# dungeons/scythe/on_right_click.mcfunction
# @s is the player

# Marcar al jugador como lanzador
tag @s add vexp.projectile_owner

# Spawn projectile marker in front of player, preserving look direction.
execute rotated as @s run summon minecraft:marker ^ ^ ^0.8 {Tags:["vexp.projectile","vexp.scythe_projectile","vexp.temp_projectile"],data:{proj_type:"scythe"}}

# Inicializar proyectil
execute as @e[type=marker,tag=vexp.temp_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Feedback
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player"}
