# dungeons/spear/glowing/on_hit.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

function vexp:utils/motion/apply_knockback {strength:-0.8, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit
function vexp:utils/sound {sound: "minecraft:item.glow_ink_sac.use", type: "player"}
