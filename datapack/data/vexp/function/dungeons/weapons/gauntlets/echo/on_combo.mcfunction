# dungeons/gauntlets/netherite/on_combo.mcfunction
# @s is the target entity

#Mark target
function vexp:dungeons/states/echo_marked

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-3.5, y:1.5}

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_punch_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
