# Spellbook on right click
# @s is the player

tag @s add vexp.projectile_owner
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.spellbook_projectile",proj_type:"echo_spellbook",proj_data:{}}
execute rotated as @s positioned ^ ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:item_display,tag=vexp.spellbook_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

tag @s add vexp.projectile_owner
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.spellbook_projectile1",proj_type:"echo_spellbook",proj_data:{}}
execute rotated as @s positioned ^-0.8 ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:item_display,tag=vexp.spellbook_projectile1,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

tag @s add vexp.projectile_owner
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.spellbook_projectile2",proj_type:"echo_spellbook",proj_data:{}}
execute rotated as @s positioned ^0.8 ^ ^0.8 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @e[type=minecraft:item_display,tag=vexp.spellbook_projectile2,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

# Feedback
function vexp:dungeons/fx/right_click/echo
function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player", pitch:1}
