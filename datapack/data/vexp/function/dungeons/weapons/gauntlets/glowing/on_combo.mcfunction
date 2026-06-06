# dungeons/gauntlets/glowing/on_combo.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

# Strong push away
function vexp:utils/motion/apply_knockback {strength:-3.5, y:1.5}

#Buff
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/glow_buffed

# Visuals
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_punch_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit

function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
