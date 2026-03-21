# @s is the player, @e[tag=vexp.hitted] is the mob
# Apply knockback to mob
function vexp:utils/motion/apply_knockback {strength:0.5, y:0.1}

particle minecraft:sculk_charge_pop ~ ~1 ~ 0.2 0.2 0.2 0.05 3
execute positioned ~ ~1 ~ run function vexp:utils/feedback/dust_particle {initialColor: [0.2, 0.2, 0.2], finalColor: [0.3, 0.5, 0.55], scale: 0.8, dX: 0.2, dY: 0.2, dZ: 0.2, speed: 0.05, count: 1}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.sweep", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_sensor.clicking", type: "player"}
