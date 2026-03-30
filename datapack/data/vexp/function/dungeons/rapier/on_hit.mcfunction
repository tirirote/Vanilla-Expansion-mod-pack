# dungeons/rapier/on_hit.mcfunction
# @s is the target entity

function vexp:utils/motion/apply_knockback {strength:0.25, y:0.1}
effect give @p[tag=vexp.attacker,limit=1] speed 3 0 true

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/common_hit
function vexp:utils/sound {sound: "minecraft:item.trident.hit_ground", type: "player"}
