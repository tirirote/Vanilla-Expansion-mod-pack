# Shockwave: spawn a forward projectile on combo finisher.

tag @s add vexp.projectile_owner

data modify storage vexp:temp projectile_spawn set value {projectile_tag:"vexp.enchantment_shockwave",proj_type:"vexp.enchantment_shockwave",proj_data:{}}
execute positioned ~ ~1.5 ~ rotated as @s positioned ^ ^ ^2 run function vexp:projectile/utils/create_armor_stand with storage vexp:temp projectile_spawn
tag @e[type=minecraft:armor_stand,tag=vexp.enchantment_shockwave,sort=nearest,limit=1,distance=..3] add vexp.keep_rotation
execute as @e[type=minecraft:armor_stand,tag=vexp.enchantment_shockwave,sort=nearest,limit=1,distance=..3] at @s run function vexp:projectile/spawn

function vexp:utils/sound {sound: "minecraft:entity.evoker.cast_spell", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.illusioner.mirror_move", type: "player"}
