# dungeons/scythe/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark mob
function vexp:dungeons/states/echo_marked

# Player effects
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

# Knockback
function vexp:utils/motion/apply_knockback with storage vexp:temp {strength:-3.5, y:0.25}

execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit

particle flash{color:-8454162} ~ ~ ~ 0 0 0 0 0
particle instant_effect{color:9497087} ~ ~1 ~ 0.2 0.2 0.2 0 1
particle sculk_charge_pop ~ ~ ~ 0.25 0.25 0.25 0.1 3

function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk.break", type: "player"}
