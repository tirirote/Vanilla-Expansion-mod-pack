# dungeons/sword/on_combo.mcfunction
# @s is the target entity

# Push wave
execute as @e[tag=vexp.hit_candidate,distance=..2] at @s positioned ~ ~1 ~ run function vexp:dungeons/sword/common_wave
# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/common_hit

function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player"}
function vexp:utils/sound {sound: "minecraft:item.trident.throw", type: "player"}
