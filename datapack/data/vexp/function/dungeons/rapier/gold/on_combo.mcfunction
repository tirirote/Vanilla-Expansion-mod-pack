# dungeons/rapier/on_combo.mcfunction
# @s is the target entity

# Strong push away for the mob
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.35}

#Player pushback
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/rapier/player_pushback
# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
