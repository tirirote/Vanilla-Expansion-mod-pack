# @s is the player, @e[tag=vexp.hitted] is the mob

# Launch 3 short-range nether slashes from the attacker.
execute as @p[tag=vexp.attacker,limit=1] at @s run summon marker ~ ~1.5 ~ {Tags:["vexp.projectile","vexp.temp_projectile","vexp.sword_nether_projectile"],data:{proj_type:"nether_sword"}}

tag @p[tag=vexp.attacker,limit=1] add vexp.projectile_owner

# Initialize the newly spawned volley.
execute as @p[tag=vexp.attacker,limit=1] at @s run execute as @e[type=marker,tag=vexp.temp_projectile,tag=vexp.sword_nether_projectile,distance=..4] at @s run function vexp:projectile/spawn

# Knockback {strength:-2.5, y:0.1}
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}
# Cast feedback.
particle minecraft:large_smoke ~ ~ ~ 0.2 0.2 0.2 0.1 3
particle minecraft:flame ~ ~ ~ 0.25 0.25 0.25 0.03 3
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
