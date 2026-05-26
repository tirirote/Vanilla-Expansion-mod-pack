# dungeons/axe/on_right_click.mcfunction
# @s is the player

tag @s add vexp.projectile_owner


# Spawn projectile marker in front of player, preserving look direction.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.axe_projectile",proj_type:"echo_axe",proj_data:{}}

execute rotated as @s positioned ^-.5 ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Inicializar proyectil
tag @e[type=minecraft:armor_stand,tag=vexp.axe_projectile,sort=nearest,limit=1,distance=..3] add vexp.keep_rotation

execute as @e[type=minecraft:armor_stand,tag=vexp.axe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn
# Giro suave mientras el swirl está activo.
#function vexp:dungeons/states/swirl_spin

function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.tendril_clicks", type: "player"}
