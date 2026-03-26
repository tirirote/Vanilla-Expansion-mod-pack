# dungeons/rapier/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Effects
function vexp:dungeons/states/echo_marked

# Launch 3 short-range nether slashes from the attacker.
data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.rapier_echo_projectile",proj_type:"echo_rapier",proj_data:{}}
execute as @p[tag=vexp.attacker,limit=1] at @s positioned ~ ~1.5 ~ run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn

tag @p[tag=vexp.attacker,limit=1] add vexp.projectile_owner

# Initialize the newly spawned volley.
execute as @p[tag=vexp.attacker,limit=1] at @s as @e[type=minecraft:armor_stand,tag=vexp.temp_projectile,tag=vexp.rapier_echo_projectile,distance=..4] at @s run function vexp:projectile/spawn

execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.02 3
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
