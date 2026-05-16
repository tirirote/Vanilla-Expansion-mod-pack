# dungeons/scythe/on_combo.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

# Player effects
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/glow_buffed

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-3.5, y:0.1}

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
