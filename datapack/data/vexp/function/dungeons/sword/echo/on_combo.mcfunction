# dungeons/sword/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

#
function vexp:dungeons/states/echo_marked
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/echo_buffed

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.25}

particle minecraft:sculk_charge_pop ~ ~1 ~ 0.2 0.2 0.2 0.02 5
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}
