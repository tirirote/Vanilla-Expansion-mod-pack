# dungeons/rapier/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Effects
function vexp:dungeons/states/echo_marked

# Launch 3 short-range nether slashes from the attacker.
execute as @p[tag=vexp.attacker,limit=1] at @s run summon marker ~ ~1.5 ~ {Tags:["vexp.projectile","vexp.temp_projectile","vexp.rapier_echo_projectile"],data:{proj_type:"echo_rapier"}}

tag @p[tag=vexp.attacker,limit=1] add vexp.projectile_owner

# Initialize the newly spawned volley.
execute as @p[tag=vexp.attacker,limit=1] at @s as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.rapier_echo_projectile,distance=..4] at @s run function vexp:projectile/spawn

execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.02 3
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
