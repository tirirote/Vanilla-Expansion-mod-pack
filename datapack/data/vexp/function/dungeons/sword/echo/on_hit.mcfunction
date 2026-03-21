# dungeons/sword/echo/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Effects
function vexp:dungeons/states/echo_marked
# Knockback {strength:0.5, y:0.2}
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.2}

particle minecraft:sculk_charge_pop ~ ~1 ~ 0.2 0.2 0.2 0.02 5
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_sensor.clicking", type: "player"}
