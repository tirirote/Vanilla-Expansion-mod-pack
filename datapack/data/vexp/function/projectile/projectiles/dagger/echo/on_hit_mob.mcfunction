# Echo projectile hook on entity hit
execute as @e[predicate=vexp:is_target,tag=vexp.echo_marked,distance=..6,sort=nearest,limit=1] at @s positioned ~ ~.05 ~ if block ^ ^ ^-5 #replaceable run tp @p[tag=vexp.projectile_owner,limit=1] ^ ^ ^-5 facing entity @s

execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:dungeons/states/echo_marked
execute as @e[predicate=vexp:is_target,distance=..2,sort=nearest,limit=1] run function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.1}

function vexp:utils/hits/echo_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}


