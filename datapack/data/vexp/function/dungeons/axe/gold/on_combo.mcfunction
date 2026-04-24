# dungeons/axe/on_combo.mcfunction
# @s is the target entity (one of them)

# 2. Strong knockback for the primary target
function vexp:utils/motion/apply_knockback {strength:-0.5, y:1}

#Player buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/gold_buffed

# Visual feedback
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
