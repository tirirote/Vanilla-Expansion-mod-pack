# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

#Tag Mob
function vexp:dungeons/states/echo_marked

# Knockback {strength:1.0, y:0.2}
function vexp:utils/motion/apply_knockback {strength:1.5, y:0.2}

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
