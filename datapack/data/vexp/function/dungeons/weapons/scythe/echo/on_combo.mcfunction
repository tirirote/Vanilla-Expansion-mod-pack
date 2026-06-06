# dungeons/scythe/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/echo_marked

# Player effects
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Knockback
function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.25}

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/echo_hit

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
