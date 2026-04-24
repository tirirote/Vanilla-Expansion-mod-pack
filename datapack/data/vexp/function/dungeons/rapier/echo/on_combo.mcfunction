# dungeons/rapier/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

#Mark the mob
function vexp:dungeons/states/echo_marked

# Strong push away for the mob
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.35}

#Special Rapier proj
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.echo_projectile",proj_type:"echo_rapier",proj_data:{}}

tag @p[tag=vexp.attacker,limit=1] add vexp.projectile_owner
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ positioned ^ ^ ^1 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.echo_projectile,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

#Player pushback
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/rapier/player_pushback

execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/echo_hit

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
