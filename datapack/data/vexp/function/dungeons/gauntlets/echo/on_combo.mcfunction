# dungeons/gauntlets/echo/on_combo.mcfunction
# @s is the player, @e[tag=vexp.hitted] is the mob

# Mark corruption
function vexp:dungeons/states/echo_marked


# AoE push and effects
particle minecraft:sculk_soul ~ ~1 ~ 0.2 0.2 0.2 0.05 3
particle minecraft:sonic_boom ~ ~1 ~ 0.0 0.0 0.0 1 1
particle minecraft:large_smoke ~ ~1 ~ 0.2 0.2 0.2 0.02 3
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.warden.attack_impact", type: "player"}

# Knockback {strength:1.0, y:0.25}
function vexp:utils/motion/apply_knockback {strength:-1.5, y:0.25}
