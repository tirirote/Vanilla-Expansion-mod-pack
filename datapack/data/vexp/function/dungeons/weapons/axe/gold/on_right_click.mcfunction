# dungeons/axe/on_right_click.mcfunction
# @s is the player

#Tag player
tag @s add vexp.projectile_owner

# Spawn projectile marker in front of player, preserving look direction.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.axe_projectile",proj_type:"golden_axe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^2 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Inicializar proyectil
tag @e[type=minecraft:armor_stand,tag=vexp.axe_projectile,sort=nearest,limit=1,distance=..3] add vexp.keep_rotation
execute as @e[type=minecraft:armor_stand,tag=vexp.axe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

#Axe Buff
execute unless entity @s[tag=vexp.axe_rage] run function vexp:dungeons/states/axe_rage

#Quality buff
#function vexp:dungeons/states/gold_buffed

#Feedback
particle sweep_attack ^ ^ ^1 1 1 1 1 0
particle flash{color:-655515} ^ ^ ^1 0.0 0.0 0.0 1 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
