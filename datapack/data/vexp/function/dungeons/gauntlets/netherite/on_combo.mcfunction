# dungeons/gauntlets/netherite/on_combo.mcfunction
# @s is the target entity

#Mark target
function vexp:dungeons/states/nether_marked

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-3.5, y:1.5}

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/nether_buffed

# Visuals
execute positioned ~ ~1 ~ run function vexp:utils/hits/strong_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/gold_hit
function vexp:utils/sound {sound: "minecraft:entity.blaze.hurt", type: "player"}
