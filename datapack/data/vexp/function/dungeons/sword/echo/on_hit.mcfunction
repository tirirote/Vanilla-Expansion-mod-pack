# dungeons/sword/on_hit.mcfunction
# @s is the target entity

#Mark mob
function vexp:dungeons/states/echo_marked

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_sword_hit
particle minecraft:squid_ink ~ ~1 ~ 0.2 0.2 0.2 0.1 3
particle sculk_charge_pop ~ ~ ~ 0.25 0.25 0.25 0.1 3
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
