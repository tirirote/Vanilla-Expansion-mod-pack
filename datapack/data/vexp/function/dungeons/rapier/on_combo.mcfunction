# dungeons/rapier/on_combo.mcfunction
# @s is the target entity

# Strong push away for the mob
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.35}

particle cloud ~ ~1 ~ 0.1 0.5 0.1 0.05 5
particle effect ~ ~ ~ 0.2 0.2 0.2 0.1 5

#Player pushback
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/rapier/player_pushback
# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/common_hit
function vexp:utils/sound {sound: "minecraft:entity.phantom.flap", type: "player"}
