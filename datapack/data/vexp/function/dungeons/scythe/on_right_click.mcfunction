# dungeons/scythe/on_right_click.mcfunction
# @s is the player

# Marcar al jugador como lanzador
tag @s add vexp.projectile_owner

# Spawn projectile marker in front of player, preserving look direction.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.scythe_projectile",proj_type:"scythe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Inicializar proyectil
execute as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Feedback
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player"}
