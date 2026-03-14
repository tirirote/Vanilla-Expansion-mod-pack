# @s is the player, @e[tag=vexp.hitted] is the mob
# Mark mob
function vexp:dungeons/states/nether_marked

# Knockback {strength:-2.5, y:0.1}
function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
