# dungeons/axe/on_right_click.mcfunction
# @s is the player

#Remove hold tag
tag @s remove vexp.skill_hold_ready

#Tag player
tag @s add vexp.projectile_owner

# Spawn projectile marker in front of player, preserving look direction.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.axe_projectile",proj_type:"common_axe",proj_data:{}}
execute rotated as @s positioned ^ ^ ^2 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

# Inicializar proyectil
tag @e[type=minecraft:armor_stand,tag=vexp.axe_projectile,sort=nearest,limit=1,distance=..3] add vexp.keep_rotation
execute as @e[type=minecraft:armor_stand,tag=vexp.axe_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Anchored Block breaking
execute positioned ^ ^ ^6 if block ~ ~ ~ #vexp:axe_targets if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/axe/handle_block_break
execute positioned ^ ^ ^5 if block ~ ~ ~ #vexp:axe_targets if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/axe/handle_block_break
execute positioned ^ ^ ^4 if block ~ ~ ~ #vexp:axe_targets if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/axe/handle_block_break
execute positioned ^ ^ ^3 if block ~ ~ ~ #vexp:axe_targets if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/axe/handle_block_break
execute positioned ^ ^ ^2 if block ~ ~ ~ #vexp:axe_targets if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/axe/handle_block_break
execute positioned ^ ^ ^1 if block ~ ~ ~ #vexp:axe_targets if block ^ ^ ^-1 #replaceable run function vexp:dungeons/weapons/axe/handle_block_break

#Debuff
function vexp:dungeons/states/mining_debuff

#Feedback
particle sweep_attack ^ ^ ^1 1 1 1 1 0
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player", pitch:1}
