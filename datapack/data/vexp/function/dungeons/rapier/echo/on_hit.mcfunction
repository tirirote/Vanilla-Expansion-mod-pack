# dungeons/rapier/echo/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Knockback {strength:0.5, y:0.2}
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.02 3
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_sensor.clicking", type: "player"}
