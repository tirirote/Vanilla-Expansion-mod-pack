# dungeons/scythe/glowing/on_combo.mcfunction
# @s is the target entity

# Mark mob
function vexp:dungeons/states/glow_marked

# Player effects
execute as @p[tag=vexp.attacker,limit=1] run function vexp:dungeons/states/glow_buffed

# Knockback
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.2}

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_sword_hit
execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/glowing_hit

function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
