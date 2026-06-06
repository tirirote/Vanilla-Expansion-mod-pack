# dungeons/rapier/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:-0.25, y:0.1}
effect give @p[tag=vexp.attacker,limit=1] speed 2 0 true

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/weak_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:entity.ender_eye.death", type: "player"}
