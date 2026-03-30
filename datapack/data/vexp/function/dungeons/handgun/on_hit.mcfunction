# dungeons/handgun/on_hit.mcfunction
# @s is the hit target (assigned by combo_system)

function vexp:utils/motion/apply_knockback {strength:-0.5, y:0.1}

# Feedback ligero por impacto de bala dentro del pipeline de combos.
execute positioned ~ ~1 ~ run function vexp:utils/hits/common_hit
function vexp:utils/sound {sound: "minecraft:block.vault.hit", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.strong", type: "player"}
