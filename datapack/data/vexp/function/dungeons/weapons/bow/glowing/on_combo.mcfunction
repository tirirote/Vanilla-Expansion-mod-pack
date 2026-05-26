# dungeons/bow/glowing/on_combo.mcfunction
# @s is the target entity

#Mark the target
function vexp:dungeons/states/glow_marked

# Default combo impact feedback for bows
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.2}
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/bow/player_pushback

execute positioned ~ ~1 ~ run function vexp:utils/hits/weak_punch_hit
execute positioned ~ ~1 ~ run function vexp:utils/hits/glowing_hit

function vexp:utils/sound {sound: "minecraft:item.trident.return", type: "player"}
function vexp:utils/sound {sound: "minecraft:entity.glow_squid.squirt", type: "player"}
