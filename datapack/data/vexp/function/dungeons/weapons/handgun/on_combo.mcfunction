# dungeons/handgun/on_combo.mcfunction
# @s is a target tagged as vexp.hitted.combo_end by combo_system

# Finisher: explosión ligera de impacto al completar combo.
function vexp:utils/motion/apply_knockback {strength:-2.5, y:0.1}

execute as @e[predicate=vexp:is_target,distance=..2.5] at @s run function vexp:dungeons/weapons/handgun/wave
execute as @p[tag=vexp.attacker,limit=1] at @s run function vexp:dungeons/weapons/handgun/player_pushback

execute positioned ~ ~1 ~ run function vexp:dungeons/fx/hits/strong_punch_hit
function vexp:utils/sound {sound: "minecraft:item.firecharge.use", type: "player", pitch:1}
function vexp:utils/sound {sound: "minecraft:entity.player.attack.crit", type: "player", pitch:1}
