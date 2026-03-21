# dungeons/scythe/netherite/on_hit.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

#Tag Mob
function vexp:dungeons/states/echo_marked

# Knockback {strength:1.0, y:0.2}
function vexp:utils/motion/apply_knockback {strength:1.0, y:0.2}

# Player effects
execute as @p[tag=vexp.attacker] run function vexp:dungeons/states/echo_buffed

particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.02 3
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 5
function vexp:utils/sound {sound: "minecraft:item.armor.equip_netherite", type: "player"}
function vexp:utils/sound {sound: "minecraft:block.sculk_sensor.clicking", type: "player"}
