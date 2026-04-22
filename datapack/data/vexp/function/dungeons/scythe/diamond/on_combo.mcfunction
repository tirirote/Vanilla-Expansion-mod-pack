# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/diamond_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
