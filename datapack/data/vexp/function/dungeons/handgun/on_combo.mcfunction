# dungeons/handgun/on_combo.mcfunction
# @s is a target tagged as vexp.hitted.combo_end by combo_system

# Finisher: explosión ligera de impacto al completar combo.
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}

execute as @e[predicate=vexp:is_target,distance=..2] at @s positioned ~ ~1 ~ run function vexp:dungeons/handgun/wave

function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}
